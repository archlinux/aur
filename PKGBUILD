pkgname=arctimepro
pkgver=3.1
pkgrel=1
pkgdesc="A Simple, powerful and efficient cross-platform subtitle production software"
arch=("i686" "x86_64")
url="https://arctime.org"
license=('custom')
depends=('ffmpeg' 'java-runtime=8' 'vlc')
conflicts=('arctime')
sha256sums=('5a556ac8349b8844c4a52e118f6334a0b685030b6167a42114703ad0fd04f8cb'
            '9f490a4fc4d4f15e31b15e84717e11ce794e908055484f22d02aa0a166093677'
            '406a3953b7b5d54814f6613f23badc0eff04909688d67295371aeeead862ae85'
            'fcd6ecf0a786658968d0c8747b860b5238c0df73c873642dd7ce5fca186d2122'
            'c9bc9ac2ffdc703b672c1f918ea4d48479693bdc69dfd346a077547de47ce7d1'
            '346fa1d54c67f48406688eade0a0032af83410a1ff0d846f4388ac7f7fcdcef3')
source=(
	"ARCTIME_PRO_${pkgver}_LINUX.7z::https://t.arctime.cn/ap2x"
	16x16.png
	24x24.png
	32x32.png
	48x48.png
	${pkgname}.desktop
)
package() {
	for png in *.png; do
    	install -D ./${png} "${pkgdir}/usr/share/icons/hicolor/${png%.*}/apps/${pkgname}.png"
	done

	install -D ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	
	cd "${srcdir}/ARCTIME_PRO_${pkgver}_LINUX"	
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -r "./ArcTime_lib" "${pkgdir}/opt/${pkgname}/"
	cp -r "./resources" "${pkgdir}/opt/${pkgname}/"
	for res in ${pkgdir}/opt/${pkgname}/resources/*; do
		chmod 644 ${res}
	done
	cp -r "./tools" "${pkgdir}/opt/${pkgname}/"
	sed -i '2,6d' "./run.sh"
	sed -i "3 icd /opt/${pkgname}/" "./run.sh"
	sed -i 's/java-8-openjdk-amd64/java-8-openjdk/g' "./run.sh"
	install -D "./run.sh" "${pkgdir}/opt/${pkgname}/run.sh"
	install -D "./tools/GPL LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
	install -D "./ArcTime.jar" "${pkgdir}/opt/${pkgname}/ArcTime.jar"
	chmod +x "${pkgdir}/opt/${pkgname}/tools/x86/ffmpeg-linux32"
	chmod +x "${pkgdir}/opt/${pkgname}/tools/x86/ffprobe-linux32"
	chmod +x "${pkgdir}/opt/${pkgname}/tools/x64/ffmpeg-linux64"
	chmod +x "${pkgdir}/opt/${pkgname}/tools/x64/ffprobe-linux64"
	mkdir -p "${pkgdir}/usr/bin"
	ln -sf "/opt/${pkgname}/run.sh" "${pkgdir}/usr/bin/${pkgname}"
}
