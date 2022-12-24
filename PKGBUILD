# Maintainer: Andrew <aandrew.me@pm.me>
pkgname="ytdownloader-gui"
pkgver=3.10.0
pkgrel=1
pkgdesc="GUI video downloader supporting hundreds of sites"
arch=('any')
url="https://github.com/aandrew-me/ytDownloader"
license=('GPL3')
conflicts=('ytdownloader-gui')
groups=()
depends=('yt-dlp' 'ffmpeg' 'electron')
makedepends=('git' 'npm' 'jq' 'sed')
# install=$pkgname.install
source=("$pkgname-$pkgver::https://github.com/aandrew-me/ytDownloader/archive/refs/tags/v${pkgver}.tar.gz"
'ytdownloader-gui.sh' 'ytdownloader-gui.desktop')
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP') #autofill using updpkgsums

build() {
    mv "$srcdir"/"ytDownloader-${pkgver}" "$srcdir"/"$pkgname"
    STRING_TO_REPLACE='ffmpeg=cp.execSync("which ffmpeg").toString("utf8").split("\\n")[0]'
    cd "$srcdir"/"$pkgname"
    rm "$srcdir"/"$pkgname/windows.sh"
    rm "$srcdir"/"$pkgname/linux.sh"
    rm -rf "${srcdir}"/"${pkgname}/flatpak"
    jq '.devDependencies = {}' <<<$(<package.json) > package.json

    sed '4,8d' ${srcdir}/${pkgname}/src/renderer.js > ${srcdir}/${pkgname}/src/temp.js
    rm ${srcdir}/${pkgname}/src/renderer.js
    mv ${srcdir}/${pkgname}/src/temp.js ${srcdir}/${pkgname}/src/renderer.js
    sed "4s/.*/$STRING_TO_REPLACE/" ${srcdir}/${pkgname}/src/renderer.js > ${srcdir}/${pkgname}/src/render.js
    rm "$srcdir/${pkgname}/src/renderer.js"
    mv "$srcdir/${pkgname}/src/render.js" "$srcdir/${pkgname}/src/renderer.js"

    npm install

    rm "$srcdir"/"$pkgname/package-lock.json"

}

package() {
  # cd "$srcdir"/"$pkgname"
  mkdir -p ${pkgdir}/usr/share/
  cp -r "$srcdir"/"$pkgname" ${pkgdir}/usr/share/${pkgname}

 # binary wrapper
  install -Dm 775 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}

 # desktop entry
  install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop  

  # icons
  install -Dm 644 ${srcdir}/${pkgname}/resources/icon.png ${pkgdir}/usr/share/icons/${pkgname}.png


}
