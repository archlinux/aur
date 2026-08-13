# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=calibre-bin
pkgver=9.13.0
pkgrel=1
pkgdesc="Official binary version Calibre"
arch=(x86_64)
url="https://download.calibre-ebook.com"
license=(GPL3)
depends=(libglvnd fontconfig libxkbcommon nss alsa-lib)
makedepends=(python-sphinx)
optdepends=()
conflicts=(calibre calibre-git)
provides=()
options=('!strip')

# Sources
#   Since there doesn't seem to be a simple way to generate desktop
#   integration files without building calibre from source,
#   we'll provide them here
source=(
	share.tar.xz
	$url/${pkgver}/calibre-${pkgver}-x86_64.txz
	"calibre-${pkgver}.tar.gz::https://github.com/kovidgoyal/calibre/archive/refs/tags/v${pkgver}.tar.gz"
)

prepare() {
    # don't want the sources symlinks in the final tarball
    for src in "${source[@]##*/}"; do
        if [[ -L "$srcdir/$src" ]]; then
            rm "$srcdir/$src"
        fi
    done

    # Move the extracted binary release into its own directory
    # (the txz extracts directly into $srcdir)
    mkdir -p "$srcdir/calibre-release"
    mv "$srcdir"/bin "$srcdir"/lib "$srcdir"/libexec \
       "$srcdir"/resources "$srcdir"/plugins "$srcdir"/translations \
       "$srcdir/calibre-release/" 2>/dev/null || true
    # Move executable files (calibre, calibre-debug, ebook-convert, etc.)
    find "$srcdir" -maxdepth 1 -type f -executable \
        -exec mv {} "$srcdir/calibre-release/" \;
}

# Checksums
sha256sums=('c7aae61afba19c9cceed8bbafd2b39b5c4d6d683de0ccfc9c1fe2651857f757a'
            'd664fe74953463f1b679945a5460234b61cbf539da48fc78f2111ff8d9503cc0'
            '733949d684c28a965747dfd697668281e1fe5fecde1a35284d9e7e81b4064146')

_build_man_pages() {
    msg2 "Building man pages using calibre-debug + sphinx..."
    cat > "$srcdir/_build_man.py" << 'BUILDEOF'
import sys, os, types

# Stub out calibre.utils.img to avoid Qt dependency at import time
class _StubModule(types.ModuleType):
    def __getattr__(self, name):
        def stub(*args, **kwargs):
            return None
        return stub
sys.modules['calibre.utils.img'] = _StubModule('calibre.utils.img')

# Add system sphinx to path. Use the site-packages tree matching the interpreter
# calibre-debug is running: other trees may hold ABI-incompatible C extensions or
# stale pure-Python packages (an orphaned python3.9 tree shadows requests with a
# copy that does 'import cgi', removed from the stdlib in 3.13). Append rather
# than prepend so nothing here can shadow calibre's frozen environment.
def _sphinx_tree():
    import glob, re
    exact = '/usr/lib/python%d.%d/site-packages' % sys.version_info[:2]
    if os.path.isdir(os.path.join(exact, 'sphinx')):
        return exact
    # No matching tree. Bundled and system python drift apart whenever one side
    # bumps first, in either direction -- a matter of when, not if -- so fall
    # back to a neighbouring tree instead of failing. Prefer the closest minor
    # version, tie-breaking forward, and refuse anything more than max_drift
    # older: a distro tree is at most a bump away, while a distant older tree is
    # an orphaned pip install, which is how sphinx ends up importing a requests
    # that does 'import cgi' (dropped from the stdlib in 3.13) and failing the
    # build. Compare numerically -- '3.9' > '3.14' lexically, the original bug.
    max_drift = 2
    cands = []
    for p in glob.glob('/usr/lib/python3.*/site-packages'):
        m = re.fullmatch(r'/usr/lib/python3\.(\d+)/site-packages', p)
        if not m or not os.path.isdir(os.path.join(p, 'sphinx')):
            continue
        behind = sys.version_info[1] - int(m.group(1))
        if behind > max_drift:
            continue
        cands.append((abs(behind), behind > 0, p))
    if not cands:
        raise SystemExit('python-sphinx not found in %s, nor in a system python within %d '
                         'minor versions of it' % (exact, max_drift))
    _, older, best = min(cands)
    print('warning: no sphinx for python%d.%d, falling %s to %s'
          % (sys.version_info[:2] + ('back' if older else 'forward', best)), file=sys.stderr)
    return best

sys.path.append(_sphinx_tree())

calibre_src = os.environ['CALIBRE_SRC']
manual_dir = os.path.join(calibre_src, 'manual')
output_dir = os.environ['MAN_OUTPUT']

sys.path.insert(0, calibre_src)

os.chdir(manual_dir)

from sphinx.application import Sphinx

destdir = os.path.join(output_dir, 'en')
doctreedir = os.path.join(output_dir, 'doctrees')
os.makedirs(destdir, exist_ok=True)
os.makedirs(doctreedir, exist_ok=True)

app = Sphinx(srcdir=manual_dir, confdir=manual_dir, outdir=destdir,
             doctreedir=doctreedir, buildername='man', freshenv=True,
             confoverrides={'language': 'en'})
app.build()
BUILDEOF

    QT_QPA_PLATFORM=offscreen \
    CALIBRE_CONFIG_DIRECTORY=$(mktemp -d) \
    CALIBRE_OVERRIDE_LANG=en \
    ALL_USER_MANUAL_LANGUAGES=en \
    CALIBRE_BUILD_MAN_PAGES=1 \
    CALIBRE_SRC="$srcdir/calibre-${pkgver}" \
    MAN_OUTPUT="$srcdir/man-pages" \
        "$srcdir/calibre-release/calibre-debug" "$srcdir/_build_man.py"
}

build() {
    _build_man_pages
}

check() {
    msg2 "Verifying calibre-debug starts..."
    QT_QPA_PLATFORM=offscreen \
        "$srcdir/calibre-release/calibre-debug" -c \
        "from calibre.constants import __version__; print(f'calibre {__version__} OK')"

    msg2 "Verifying ebook-convert is functional..."
    QT_QPA_PLATFORM=offscreen \
        "$srcdir/calibre-release/ebook-convert" --version

    msg2 "Verifying man pages were generated..."
    test -f "$srcdir/man-pages/en/calibre.1"
    local count=$(find "$srcdir/man-pages/en" -name '*.1' | wc -l)
    msg2 "Found $count man pages"
    (( count >= 10 ))
}

package() {
	# Creating needed directories
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/opt/calibre"

	# Package calibre
	cp -af "$srcdir/calibre-release/"* "$pkgdir/opt/calibre"
	mv -f "$pkgdir/opt/calibre/share" "$pkgdir/usr" 2>/dev/null || true
	cp -af "$srcdir/share" "$pkgdir/usr/"
	# espeak-ng-data used by calibre
	install -dm755 "$pkgdir/opt/calibre/share"
	mv -f "$pkgdir/usr/share/espeak-ng-data" "$pkgdir/opt/calibre/share" 2>/dev/null || true

	# Create symlinks in /usr/bin
	for f in $(find "$pkgdir/opt/calibre" -maxdepth 1 -type f -printf "%f\n"); do
		ln -s "/opt/calibre/$f" "$pkgdir/usr/bin/$f"
	done

	# Install man pages
	if [[ -d "$srcdir/man-pages/en" ]]; then
		install -dm755 "$pkgdir/usr/share/man/man1"
		install -m644 "$srcdir/man-pages/en/"*.1 "$pkgdir/usr/share/man/man1/"
	fi
}
