# Maintainer: Danijel Zlaus <danijel.zlaus@gmail.com>

pkgname='meshmixer-wine'
pkgver=3.5
_pkgver=$(echo $pkgver | sed 's/\./p/g')
pkgrel=3
pkgdesc="Meshmixer is state-of-the-art software for working with triangle meshes"
arch=('x86_64')
url="http://www.meshmixer.com"
license=('proprietary')
provides=($pkgname)
depends=(wine winetricks)
makedepends=(p7zip imagemagick icoutils)
source=(meshmixer
	meshmixer.desktop
	${url}/downloads/Autodesk_Meshmixer_v${_pkgver}_Win64.exe)
sha256sums=('07bb0d678fc153c60f51a30176ca557d4533f6163b29a320855eeaf8afc45e93'
            'd56b8bd84beb8544be85000da853f98d7159a83eb9fd6ef09aa6a1513a3c975c' 
            '5d08cb6254e4d4280137d6d37ec689fc3f0c61dad08bbc978a451ac16b7f271c')
noextract=('Autodesk_Meshmixer_v${_pkgver}_Win64.exe')
options=(!strip)

prepare() {
	7z x -aoa -o$pkgname Autodesk_Meshmixer_v${_pkgver}_Win64.exe > /dev/null
	wrestool -x -t 14 Autodesk_Meshmixer_v3p5_Win64.exe > icons.ico
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"

    cp -R $pkgname ${pkgdir}/opt

    find ${pkgdir}/opt/${pkgname} -type d -exec chmod 755 "{}" \;
    find ${pkgdir}/opt/${pkgname} -type f -exec chmod 644 "{}" \;

    install -m755 meshmixer $pkgdir/usr/bin/meshmixer
    install -m644 meshmixer.desktop $pkgdir/usr/share/applications
    #Extract icons
    IFS=$'\n'
    local cnt=0
    for i in $(identify icons.ico); do 
     dim=$(echo $i | gawk 'match($0, /([0-9]+)x[0-9]+/ , a) {print a[1]}')
     ico_dir=${pkgdir}/usr/share/icons/hicolor/${dim}x${dim}/apps
     mkdir -p "${ico_dir}"
     convert icons.ico[$cnt] -thumbnail ${dix}x${dim} -flatten ${ico_dir}/meshmixer.png
     cnt=$((cnt+1))
    done
}

