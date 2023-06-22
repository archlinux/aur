# Maintainer: Fernando Seoane <fseoane@hotmail.com>
pkgname=pynotify-git
pkgbase=pynotify-git
srcname=pyNotify
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
	cd "${_srcname}"
	printf "4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcname"
 	echo "$pkgver" > pyNotify.ver
}

build() {
	#sudo pacman -S --needed libappindicator-gtk3 gnome-shell-extension-appindicator
	#sudo pacman -S --needed git python3 python-pip python-virtualenv
	
	cd "$srcname"
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
	cd "$srcname"

	sudo rm /opt/${srcname}/${srcname}
	sudo rm /opt/${srcname}/${srcname}.desktop
	sudo rm /opt/${srcname}/${srcname}.conf.sample
	sudo rm /opt/${srcname}/${srcname}.ver
	sudo rm /opt/${srcname}/*.ogg
	sudo rm /opt/${srcname}/*.png
	sudo rm /opt/${srcname}/*.svg

	sudo mkdir -p /opt/${srcname}
	
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${srcname}/dist/${srcname} /opt/${srcname}/${srcname}
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${srcname}/${srcname}.desktop /opt/${srcname}/${srcname}.desktop
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${srcname}/*.ogg /opt/${srcname}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${srcname}/*.png /opt/${srcname}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${srcname}/*.svg /opt/${srcname}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${srcname}/${srcname}.ver /opt/${srcname}/${srcname}.ver
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${srcname}/${srcname}.conf /opt/${srcname}/${srcname}.conf.sample

	desktop-file-install --dir=$HOME/.local/share/applications /opt/${srcname}/${srcname}.desktop
	sudo install -Dm644 LICENSE "/usr/share/licenses/${srcname}/LICENSE"
    	sudo install -Dm644 README.md "/usr/share/doc/${srcname}/README.md"
}
