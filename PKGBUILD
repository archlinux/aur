# Maintainer: Fernando Seoane <fseoane@hotmail.com>
pkgname=pynotify-git
pkgbase=pynotify-git
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="A Gnome (wayland) shell notifier for Gotify server."
arch=('x86_64')
url="https://github.com/fseoane/pynotify-git.git"
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

mypackagename=pyNotify

pkgver() {
	cd "${_pkgname}"
	printf "0.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	cd "$pkgname"
	printf "0.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" > pyNotify.ver
}

# prepare() {
# 	cd "$_pkgname"
#  	echo "$pkgver" > pyNotify.ver
# }

build() {
	#sudo pacman -S --needed libappindicator-gtk3 gnome-shell-extension-appindicator
	#sudo pacman -S --needed git python3 python-pip python-virtualenv
	
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


package() {
	cd "$pkgname"

#	sudo rm /opt/${mypackagename}/${mypackagename}
#	sudo rm /opt/${mypackagename}/${mypackagename}.desktop
#	sudo rm /opt/${mypackagename}/${mypackagename}.conf.sample
#	sudo rm /opt/${mypackagename}/${mypackagename}.ver
#	sudo rm /opt/${mypackagename}/*.ogg
#	sudo rm /opt/${mypackagename}/*.png
#	sudo rm /opt/${mypackagename}/*.svg

	sudo mkdir -p ${pkgdir}/opt/${mypackagename}
	
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/dist/${mypackagename} ${pkgdir}/opt/${mypackagename}/${mypackagename}
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${mypackagename}.desktop ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.ogg ${pkgdir}/opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.png ${pkgdir}/opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.svg ${pkgdir}/opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${mypackagename}.ver ${pkgdir}/opt/${mypackagename}/${mypackagename}.ver
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${mypackagename}.conf ${pkgdir}/opt/${mypackagename}/${mypackagename}.conf.sample

	desktop-file-install --dir=$HOME/.local/share/applications ${pkgdir}/opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	sudo install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
