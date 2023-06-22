# Maintainer: Fernando Seoane <fseoane@hotmail.com>
pkgname=pynotify-git
pkgbase=pyNotify
pkgver=4.0
pkgrel=1
epoch=
pkgdesc="A Gnome (wayland) shell notifier for Gotify server."
arch=('x86_64')
url="https://github.com/fseoane/pyNotify.git"
license=('MIT')
groups=()
depends=('libappindicator-gtk3' 'gnome-shell-extension-appindicator')
makedepends=('git' 'python3' 'python-pip' 'python-virtualenv')
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
	cd "${_pkgbase}"
	printf "4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgbase"
 	echo "$pkgver" > pyNotify.ver
}

build() {
	#sudo pacman -S --needed libappindicator-gtk3 gnome-shell-extension-appindicator
	#sudo pacman -S --needed git python3 python-pip python-virtualenv
	
	cd "$pkgbase"
	mkdir .env 
	python -m venv .env
	source .env/bin/activate
	
	python  -m pip install --upgrade pip # setuptools wheel

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
	cd "$pkgbase"

	sudo rm /opt/${pkgbase}/${pkgbase}
	sudo rm /opt/${pkgbase}/${pkgbase}.desktop
	sudo rm /opt/${pkgbase}/${pkgbase}.conf.sample
	sudo rm /opt/${pkgbase}/${pkgbase}.ver
	sudo rm /opt/${pkgbase}/*.ogg
	sudo rm /opt/${pkgbase}/*.png
	sudo rm /opt/${pkgbase}/*.svg

	sudo mkdir -p /opt/${pkgbase}
	
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgbase}/dist/${pkgbase} /opt/${pkgbase}/${pkgbase}
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgbase}/${pkgbase}.desktop /opt/${pkgbase}/${pkgbase}.desktop
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgbase}/*.ogg /opt/${pkgbase}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgbase}/*.png /opt/${pkgbase}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgbase}/*.svg /opt/${pkgbase}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgbase}/${pkgbase}.ver /opt/${pkgbase}/${pkgbase}.ver
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgbase}/${pkgbase}.conf /opt/${pkgbase}/${pkgbase}.conf.sample

	desktop-file-install --dir=$HOME/.local/share/applications /opt/${pkgbase}/${pkgbase}.desktop
	sudo install -Dm644 LICENSE "/usr/share/licenses/${pkgbase}/LICENSE"
    	sudo install -Dm644 README.md "/usr/share/doc/${pkgbase}/README.md"
}
