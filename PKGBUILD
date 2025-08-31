# Maintainer: Neal (Yichen) Ning <yichen.ning.2021@gmail.com>
pkgname='nowaymouse-git'
pkgver=r0.g0000000
pkgrel=1
pkgdesc="Control mouse position, movements and actions with keyboard on wlroots-based wayland compositors."
arch=(
    'x86_64'
    'aarch64'
)
url="https://github.com/Neal-Ning/nowaymouse"
license=('GPL3')
depends=(
    'python'
    'python-gobject'
    'python-cairo'
    'python-yaml'
    'gtk3'
    'gtk-layer-shell'
)
makedepends=(
    'git'
    'go'
)
source=('nowaymouse-git::git+https://github.com/Neal-Ning/nowaymouse.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  mkdir -p "$srcdir/build"
}

build() {
	cd "$srcdir/$pkgname"
    go build -o "$srcdir/build/nowaymouse" .
}

package() {
	cd "$srcdir/$pkgname"
    install -Dm755 "$srcdir/build/nowaymouse" "$pkgdir/usr/lib/$pkgname/nowaymouse"
    install -Dm644 "$srcdir/$pkgname/default.yaml" "$pkgdir/usr/lib/$pkgname/default.yaml"

    install -Dm755 "$srcdir/$pkgname/overlay.py" "$pkgdir/usr/lib/$pkgname/overlay.py"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/nwm-overlay" << 'EOF'
#!/usr/bin/env python
import runpy, sys
sys.exit(runpy.run_path("/usr/lib/nowaymouse-git/overlay.py", run_name="__main__"))
EOF
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/lib/$pkgname/nowaymouse" "$pkgdir/usr/bin/nowaymouse"
}
