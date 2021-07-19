# Maintainer: Hauke Rehfeld <aur.archlinux.org@haukerehfeld.de>
pkgname=python-keyring-minimal-git
pkgver=r12.5c266c5
pkgrel=1
pkgdesc="A minimal libsecret keyring in python that works with keepassxc."
arch=(any)
url="https://github.com/hrehfeld/python-keyring-minimal"
depends=('python' 'libsecret')
license=(AGPL-3.0)
makedepends=("python" "python-pip" "git" 'python-build')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git checkout master
	sed -i "s/^version=[.0-9]*$/version=$pkgver/" setup.cfg
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python -m build
  pip install --no-deps --target="keyring-minimal" "dist/keyring-minimal-$pkgver.tar.gz"
}

package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p $pkgdir/"$sitepackages"
  cp -r $srcdir/${pkgname%-git}/keyring-minimal/* $pkgdir/"$sitepackages"
	sh -c "rm $pkgdir/usr/lib/python3.9/site-packages/keyring_minimal-*.dist-info/direct_url.json"

	for f in "keyring-minimal-askpass"
	do
		install -Dm755 "$srcdir/${pkgname%-git}/$f" "$pkgdir/usr/bin/$f"
	done
	ln -sf /usr/lib/python3.9/site-packages/bin/keyring-minimal "$pkgdir/usr/bin/"
}
