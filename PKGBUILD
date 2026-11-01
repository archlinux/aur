pkgname=makepkg-jail-local
pkgver=0.1.1
pkgrel=1
pkgdesc='Local bubblewrap makepkg sandbox with AppArmor and a restricted paru adapter'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(
    'apparmor'
    'bash'
    'bubblewrap'
    'coreutils'
    'gnupg'
    'pacman'
    'util-linux'
)

makedepends=(
    'python'
    'python-libseccomp'
    'shellcheck'
)

optdepends=(
    'base-devel: standard Arch package build tools'
    'paru: use the paru-makepkg-jail adapter'
)

install=makepkg-jail-local.install

backup=(
    'etc/apparmor.d/makepkg-jail-build'
)

options=(
    '!debug'
    '!strip'
)

source=(
    'makepkg-jail'
    'paru-makepkg-jail'
    'gen-seccomp.py'
    'bwrap.profile'
    'build.profile'
)

# Local development placeholders. Replace with real hashes before
# distributing the package, or use updpkgsums before building.
sha256sums=('2165a7c30f196ce554c3e28cb99b2c850bf7e13543b3efaf260a645da575c1cd'
            'ab7166fce9de9085ec89bdcb4747493f28a3dfb094d701b205751e954b020582'
            'ecf24a3118060612c6a38c26a038acbe6a7e5c8531bcb65837ec7d17e3d8ecbf'
            '5b33033b0e1190d6b77666e6b76b858c1b4f5df854ffb2bc8e83f2a3c3f80e32'
            '44a4836379763312e7a81e8b9100230d60c6dbdb90fce1a2ac965fcf8d8a01a3')

prepare() {
    cd "$srcdir"

    # Patch only the build copy, leaving the source script untouched.
    # Accept either the original per-user path or an already-patched
    # system path, so repeated preparation is safe.
    python - <<'PY'
from pathlib import Path

path = Path("makepkg-jail")
text = path.read_text()

old = 'filter="$data/seccomp.bpf"'
new = 'filter="/usr/lib/makepkg-jail/seccomp.bpf"'

if text.count(old) == 1 and text.count(new) == 0:
    path.write_text(text.replace(old, new))
elif text.count(old) == 0 and text.count(new) == 1:
    pass
else:
    raise SystemExit(
        "Unexpected seccomp path configuration in makepkg-jail; refusing to patch."
    )
PY
}

build() {
    cd "$srcdir"

    # The generator must fail if a required filter rule cannot be added.
    python gen-seccomp.py seccomp.bpf
}

check() {
    cd "$srcdir"

    bash -n makepkg-jail
    bash -n paru-makepkg-jail
    test -s seccomp.bpf
    shellcheck makepkg-jail paru-makepkg-jail

    # Syntax-check both profiles without loading them into the kernel
    # or reading/writing the parser cache.
    apparmor_parser -Q -T -o /dev/null build.profile
    apparmor_parser -Q -T -o /dev/null bwrap.profile
}

package() {
    cd "$srcdir"

    install -Dm755 makepkg-jail \
        "$pkgdir/usr/bin/makepkg-jail"

    install -Dm755 paru-makepkg-jail \
        "$pkgdir/usr/bin/paru-makepkg-jail"

    install -Dm644 seccomp.bpf \
        "$pkgdir/usr/lib/makepkg-jail/seccomp.bpf"

    # Retain the generator as readable source; it is not run at runtime.
    install -Dm644 gen-seccomp.py \
        "$pkgdir/usr/share/makepkg-jail/gen-seccomp.py"

    # Package-owned build policy, installed in the standard location.
    install -Dm644 build.profile \
        "$pkgdir/etc/apparmor.d/makepkg-jail-build"

    # The global bwrap policy remains administrator-managed.
    install -Dm644 bwrap.profile \
        "$pkgdir/usr/share/makepkg-jail/profiles/usr.bin.bwrap"
}
