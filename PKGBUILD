# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=irpf2022
pkgver=2022.1.8
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) program (2022 version)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/assuntos/meu-imposto-de-renda'
license=('custom')
depends=('sh' 'java-runtime=11' 'hicolor-icon-theme')
makedepends=('imagemagick' 'librsvg')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/irpf/arquivos/IRPF${pkgver%%.*}-${pkgver#*.}.zip"
        'https://upload.wikimedia.org/wikipedia/commons/e/e8/Logo_Receita_Federal_do_Brasil.svg'
        'irpf.desktop'
        'irpf.sh'
        'LICENSE')
sha256sums=('33bbef2ad800b36734d5992210b58abd536fdaea7705a5fd8b384f56a627468d'
            '60c46521699aa3aeaadcb6a51b2727f3e9eb0c23a99334903c01f858c16f8f73'
            'd6130e10bed2edb80c318a5646f4bcbddd8ebd27d68b126edb0ba5d538e9e686'
            'ce78ae79d3c068d06a46bb71df8040a2f8ab9586bb449965f68bc74ccc712645'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
	local _res
	for _res in 16 32 48 64 128 256
	do
		magick -background none Logo_Receita_Federal_do_Brasil.svg -resize "${_res}x${_res}" "IRPF${pkgver%%.*}/irpf_${_res}x${_res}.png"
	done
}

package() {
	install -D -m755 irpf.sh "${pkgdir}/usr/bin/irpf-${pkgver%%.*}"
	install -D -m644 irpf.desktop "${pkgdir}/usr/share/applications/irpf-${pkgver%%.*}.desktop"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 "IRPF${pkgver%%.*}"/{irpf,pgd-updater}.jar -t "${pkgdir}/usr/share/java/irpf-${pkgver%%.*}"
	install -D -m644 "IRPF${pkgver%%.*}/Leia-me.htm" -t "${pkgdir}/usr/share/doc/irpf-${pkgver%%.*}"
	cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/irpf-${pkgver%%.*}"
	cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/"lib{,-modulos} "${pkgdir}/usr/share/java/irpf-${pkgver%%.*}"
	ln -s "../../doc/irpf-${pkgver%%.*}/help" "${pkgdir}/usr/share/java/irpf-${pkgver%%.*}/help"
	
	local _file
	local _res
	for _res in 16 32 48 64 128 256
	do
		install -D -m644 "IRPF${pkgver%%.*}/irpf_${_res}x${_res}.png" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/irpf-${pkgver%%.*}.png"
	done
}
