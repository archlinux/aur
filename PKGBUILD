# Maintainer: musqz <gummy-fang-deputy@duck.com>
#
# Release package, built from the v$pkgver tag. The signed extension is not built here: signing
# needs the maintainer's addons.mozilla.org credentials, so it is attached to the GitHub release
# once per version and installed to /usr/share/tabdock/tabdock.xpi for every user.
pkgname=tabdock-bin
_name=tabdock
pkgver=0.15.0
pkgrel=1
pkgdesc="Autohiding side panel for Firefox-family browsers on X11 and Wayland, signed extension"
arch=('any')
url="https://github.com/musqz/tabdock"
license=('MIT')
provides=('tabdock')
conflicts=('tabdock')
depends=('python' 'python-gobject' 'python-xlib' 'gtk3')
optdepends=('gtk-layer-shell: run on Wayland compositors such as labwc'
            'python-pywayland: follow the active window on Wayland')
install=tabdock.install
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$_name-$pkgver.xpi::$url/releases/download/v$pkgver/$_name-$pkgver.xpi")
noextract=("$_name-$pkgver.xpi")  # a zip: makepkg would unpack it otherwise
# run `updpkgsums` once the v$pkgver tag and its release asset exist
sha256sums=('2855caef3a59b77536888f29ebb9007f7c2a59dfedc11aa85e2f3d55acb6bdb4'
            '73856abf203b6795dd7c6dfb809b00adafad345c1bbd4fca3d491a404df85fcc')

prepare() {
    cd "$_name-$pkgver"
    local version
    version="$(<VERSION)"
    if [[ $version != "$pkgver" ]]; then
        echo "VERSION in the v$pkgver sources says $version" >&2
        return 1
    fi
    # the release's .xpi must be this version's extension, signed: Mozilla's signature inside (the same
    # test as packaging/sign-extension.sh) and every other file identical to extension/ in these sources.
    # manifest.json is compared by what it says: Mozilla's signing rewrites its layout (one value per line).
    python3 - "$srcdir/$_name-$pkgver.xpi" extension <<'EOF' || return 1
import json, os, sys, zipfile
xpi, src = sys.argv[1:3]
name = os.path.basename(xpi)


def same(n, data):
    path = os.path.join(src, n)
    if not os.path.isfile(path):
        return False
    with open(path, "rb") as f:
        mine = f.read()
    if n == "manifest.json":
        try:
            return json.loads(data) == json.loads(mine)
        except ValueError:
            return False
    return data == mine


with zipfile.ZipFile(xpi) as z:
    files = [n for n in z.namelist() if not n.endswith("/")]
    if "META-INF/mozilla.rsa" not in files:
        sys.exit(f"{name} from the release is not signed by Mozilla")
    differ = [n for n in files if not n.startswith("META-INF/") and not same(n, z.read(n))]
if differ:
    sys.exit(f"{name} from the release differs from extension/ in these sources ({', '.join(differ)}): it was "
             "signed from other code. Sign this version's extension (a version already signed needs a new one).")
EOF
}

package() {
    cd "$_name-$pkgver"
    local share=/usr/share/$_name f
    # the same layout install.sh creates: the relay finds the panel at ../../tabdock
    install -Dm755 tabdock "$pkgdir$share/tabdock"
    install -Dm644 VERSION "$pkgdir$share/VERSION"
    while IFS= read -r -d '' f; do
        install -Dm644 "$f" "$pkgdir$share/$f"
    done < <(find lib/tabdock -type f -not -path '*/__pycache__/*' -print0)
    install -Dm755 lib/native-host/tabdock-nmhost "$pkgdir$share/lib/native-host/tabdock-nmhost"
    install -Dm644 configs/config.toml "$pkgdir$share/configs/config.toml"
    install -Dm644 extension/icons/icon-96.png "$pkgdir$share/icon.png"
    install -Dm644 "$srcdir/$_name-$pkgver.xpi" "$pkgdir$share/$_name.xpi"

    install -d "$pkgdir/usr/bin"
    ln -s "$share/tabdock" "$pkgdir/usr/bin/tabdock"

    # system-wide native-messaging manifest (a per-user one in ~/.mozilla takes precedence), named by the
    # extension, which kept its name through the rename to tabdock
    install -d "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    sed "s|@HOST_PATH@|$share/lib/native-host/tabdock-nmhost|" configs/openbox_sidepanel.json.in \
        > "$pkgdir/usr/lib/mozilla/native-messaging-hosts/openbox_sidepanel.json"

    install -d "$pkgdir/usr/share/applications"
    sed -e "s|@BIN@|/usr/bin/tabdock|" -e "s|@ICON@|$share/icon.png|" configs/tabdock.desktop.in \
        > "$pkgdir/usr/share/applications/tabdock.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md CHANGELOG.md docs/*.md -t "$pkgdir/usr/share/doc/$pkgname"  # whichever docs the tag has
}
