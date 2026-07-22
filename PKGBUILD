pkgname=gscreenshot-git
pkgver=3.11.1.r9509509.g
pkgrel=1
pkgdesc="A simple screenshot tool supporting multiple backends. Git version, with wayland support"
arch=('any')
url="https://github.com/thenaterhood/gscreenshot"
license=('GPL')
groups=()
depends=("python"
        "python-pillow"
        "scrot"
        "gtk3"
        "python-setuptools"
        "python-gobject"
        "python-dbus"
        "slop"
        "slurp"
        "wl-clipboard"
        )
makedepends=("fakeroot"
        "gettext"
        "python-build"
        "python-installer"
        "python-wheel")
checkdepends=()
optdepends=('xclip: command line clipboard support'
            'xdg-utils: for opening screenshot files from gscreenshot'
            'pandoc: for generating the manpage at build (or use go-md2man)'
            'go-md2man: for generating the manpage at build (or use pandoc)')
provides=('gscreenshot')
conflicts=('gscreenshot')
source=("git+https://github.com/thenaterhood/gscreenshot.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gscreenshot"

    # Extract upstream version from SPEC file
    base_ver=$(grep -Po '(?<=^%define version )[^ ]+' specs/gscreenshot.spec)

    commit_hash=$(git rev-parse --short HEAD)

    printf "%s.r%s.g%s" "$base_ver" "$commit_hash"
}

build() {
        cd "$srcdir/gscreenshot"
        export PYTHONOPTIMIZE=2
        python -m build --wheel --no-isolation
}

package() {
        cd $srcdir/gscreenshot
        python -m installer --destdir="$pkgdir" dist/*.whl
        chmod +x "$pkgdir/usr/bin/gscreenshot"
        chmod +x "$pkgdir/usr/bin/gscreenshot-cli"
}
