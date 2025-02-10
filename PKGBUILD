# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord
pkgver=0.7.0
pkgrel=1
pkgdesc="Feature rich Discord TUI client."
arch=('any')
url="https://github.com/mzivic7/$pkgname"
license=('GPL')
depends=()
makedepends=('python>=3.11' 'python-pipenv' 'git')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland'
            'aspell: spellchecking')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	export PIPENV_VENV_IN_PROJECT=1
	pipenv install --dev
}

build() {
	cd "$pkgname"
	export PIPENV_VENV_IN_PROJECT=1
	pipenv run python -m PyInstaller --noconfirm --onefile --windowed --clean --name "$pkgname" "main.py"
}

package() {
	cd "$pkgname"
	install -Dm755 ./dist/$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
