# PKGBUILD file

# Maintainer: Luke Briggs <lukebriggs02@gmail.com>
pkgname=pepys
pkgver=1.0.9
pkgrel=1
epoch=
pkgdesc="A straightforward markdown editor"
arch=('any')
url="https://www.lukebriggs.dev/pepys"
license=('GPLv3')
groups=()
depends=('python' 'python-wheel' 'python-pip' 'pandoc' 'enchant' 'wkhtmltopdf' 'python-pyqt5' 'python-pyqt5-webengine' 'python-regex' 'python-pypandoc' 'python-pyenchant' 'python-setproctitle' 'python-pyaml' 'aspell' 'aspell-en')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/LukeBriggsDev/Pepys/archive/refs/tags/v1.0.9.tar.gz" "https://files.pythonhosted.org/packages/33/db/76f1151a1b0cfad532d41021b77cd231495bf72c47618166f92dcdff2ebe/num2words-0.5.10.tar.gz" "https://files.pythonhosted.org/packages/b4/01/68fcc0d43daf4c6bdbc6b33cc3f77bda531c86b174cac56ef0ffdb96faab/PyPDF2-1.26.0.tar.gz")
noextract=()
md5sums=('50faf06697e4f862b11a91cb42581a02' '1d0c24b6b789ad6bf91952d92cb6285f' '2301acc0ecbab0633d4c9b883d50ee5e')
validpgpkeys=()


build() {
    cd num2words-0.5.10
    python setup.py build
    cd ../PyPDF2-1.26.0/
    python setup.py build
}
package() {
	# Move source folders
	cd num2words-0.5.10
	python setup.py install --root="$pkgdir" --optimize=1
	cd ../PyPDF2-1.26.0
	python setup.py install --root="$pkgdir" --optimize=1
	cd ..
	mkdir -p $pkgdir/usr/share/pepys
	mkdir -p $pkgdir/usr/local/share/applications
	mkdir -p $pkgdir/usr/bin
	mv Pepys-1.0.9/src $pkgdir/usr/share/pepys
	# Create desktop entry
	echo "[Desktop Entry]
    Type=Application
    Name=Pepys
    Categories=Office;
    X-GNOME-FullName=Pepys
    Comment=A straightforward markdown journal
    Icon=/usr/share/pepys/src/main/resources/base/icons/appicons/icon.svg
    NoDisplay=false
    Exec=pepys
    Path=
    Terminal=false
    X-GNOME-UsesNotifications=false
    StartupWMClass=Pepys" > $pkgdir/usr/local/share/applications/pepys.desktop
    # Create bin file
    echo "#!/usr/bin/env sh
    python3 /usr/share/pepys/src/main/python/main.py" > $pkgdir/usr/bin/pepys
    chmod +x $pkgdir/usr/bin/pepys
}
