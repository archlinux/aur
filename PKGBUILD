# Maintainer: Fernando Seoane <fseoane@hotmail.com>
pkgname=pynotify-git
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
provides=(pynotify-git)
conflicts=(pynotify-git)
replaces=(pynotify-git)
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


pkgver() {
	cd "${_pkgname}"
	printf "4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	cd "$pkgname"
	printf "4.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" > pyNotify.ver
}

# prepare() {
# 	cd "$pkgname"
# 	echo "$pkgver" > pyNotify.ver
# }

build() {
	sudo pacman -S --needed libappindicator-gtk3 gnome-shell-extension-appindicator
	sudo pacman -S --needed git python3 python-pip python-virtualenv
	
	cd "$pkgname"
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

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	cd "$pkgname"

	sudo rm /opt/${pkgname}/${pkgname}
	sudo rm /opt/${pkgname}/${pkgname}.desktop
	sudo rm /opt/${pkgname}/${pkgname}.conf.default
	sudo rm /opt/${pkgname}/${pkgname}.ver
	sudo rm /opt/${pkgname}/*.ogg
	sudo rm /opt/${pkgname}/*.png
	sudo rm /opt/${pkgname}/*.svg

	sudo mkdir -p /opt/${pkgname}
	
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/dist/${pkgname} /opt/${pkgname}/${pkgname}
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${pkgname}.desktop /opt/${pkgname}/${pkgname}.desktop
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.ogg /opt/${pkgname}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.png /opt/${pkgname}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.svg /opt/${pkgname}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${pkgname}.ver /opt/${pkgname}/${pkgname}.ver
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${pkgname}.conf /opt/${pkgname}/${pkgname}.conf.default

	desktop-file-install --dir=$HOME/.local/share/applications /opt/${pkgname}/${pkgname}.desktop
	sudo install -Dm644 LICENSE "/usr/share/licenses/${pkgname}/LICENSE"
    sudo install -Dm644 README.md "/usr/share/doc/${pkgname}/README.md"


}
