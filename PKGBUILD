# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=irpf2022
pkgver=2022.2.2
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) program (2022 version)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/dirpf'
license=('LicenseRef-Custom')
depends=(
    'hicolor-icon-theme'
    'java-runtime=11'
    'sh')
makedepends=(
    'imagemagick'
    'librsvg')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/irpf/arquivos/IRPF${pkgver%%.*}-${pkgver#*.}.zip"
        'https://upload.wikimedia.org/wikipedia/commons/e/e8/Logo_Receita_Federal_do_Brasil.svg'
        'irpf.desktop'
        'irpf.sh'
        'LICENSE')
sha256sums=('f069777c149cd3c780c002e3c31fa099431465cb54ee1431872384d430cb8c77'
            '60c46521699aa3aeaadcb6a51b2727f3e9eb0c23a99334903c01f858c16f8f73'
            'ab9e1e5aeec398d345bd5f3778a3f16817214f27ff34348dd0053017db3888c7'
            '9bef9107689f5ef5a5b812518fdb108f43a9c237c57b3985b88bc676c5fd71f4'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
	local _res
	for _res in 16 32 48 64 128 256
	do
		magick -background none Logo_Receita_Federal_do_Brasil.svg -resize "${_res}x${_res}" "IRPF${pkgver%%.*}/irpf_${_res}x${_res}.png"
	done
}

package() {
	install -D -m755 irpf.sh "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 irpf.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 "IRPF${pkgver%%.*}"/{irpf,pgd-updater}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
	install -D -m644 "IRPF${pkgver%%.*}/Leia-me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
	cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
	cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/"lib{,-modulos} "${pkgdir}/usr/share/java/${pkgname}"
	ln -sr "${pkgdir}/usr/share/doc/${pkgname}/help" "${pkgdir}/usr/share/java/${pkgname}/help"
	
	local _res
	for _res in 16 32 48 64 128 256
	do
		install -D -m644 "IRPF${pkgver%%.*}/irpf_${_res}x${_res}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
	done
}
