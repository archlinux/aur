# Maintainer: Fernando Seoane <fseoane@hotmail.com>
mypackagename=pyNotify
pkgname=pyNotify
pkgbase=pynotify-git
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="A Gnome (wayland) shell notifier for Gotify server."
arch=('x86_64')
url="https://github.com/fseoane/pyNotify.git"
license=('MIT')
groups=()
depends=('libappindicator-gtk3' 'gnome-shell-extension-appindicator')
makedepends=('git' 'python3' 'python-pip')
checkdepends=()
optdepends=()
provides=(pyNotify)
conflicts=(pyNotify)
replaces=(pyNotify)
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


pkgver() {
	cd "$mypackagename"
	printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$mypackagename"
 	echo "$pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" > pyNotify.ver
}

build() {

	cd "$mypackagename"
	mkdir .env 
	python -m venv .env
	source .env/bin/activate
	
	python  -m pip install --upgrade pip setuptools wheel

	python -m pip cache purge

	python -m pip install gotify[stream]
	python -m pip install pyinstaller
	python -m pip install pygame
	python -m pip install pygobject
	python -m pip install asyncio
	python -m pip install pystray
	python -m pip install pillow
	python -m pip install psutil

	pyinstaller --onefile --windowed pyNotify.py

	deactivate
	rm -rf .env
}

package() {
	cd "$mypackagename"
	sudo mkdir -p /opt/${mypackagename}
	
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/dist/${mypackagename} /opt/${mypackagename}/${mypackagename}
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/${mypackagename}.desktop /opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/*.ogg /opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/*.png /opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/*.svg /opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/${mypackagename}.ver /opt/${mypackagename}/${mypackagename}.ver
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${mypackagename}/${mypackagename}.conf /opt/${mypackagename}/${mypackagename}.conf.sample

	desktop-file-install --dir=$HOME/.local/share/applications /opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm644 LICENSE "/usr/share/licenses/${mypackagename}/LICENSE"
	sudo install -Dm644 README.md "/usr/share/doc/${mypackagename}/README.md"
}
