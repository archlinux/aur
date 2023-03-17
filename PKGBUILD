# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: afterSt0rm <ateles.1@gmail.com>
# Contributor: Márcio Sousa Rocha <marciosr10@gmail.com>

pkgname=irpf
pkgver=2023.1.1
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) program'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/assuntos/meu-imposto-de-renda'
license=('custom')
depends=('sh' 'java-runtime=11' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/irpf/arquivos/IRPF${pkgver%%.*}-${pkgver#*.}.zip"
        'irpf.desktop'
        'irpf.sh'
        'LICENSE')
sha256sums=('7931112b9a826b3f17745248cfb5c417fc70b52c98553a33aa44fbd7dca555de'
            'b5026060d73cc78e0c50a8cad2536dc1f186ba0202f1d51551e2411131008430'
            '71b397a128a71ab43591a868f309125193e19632972925f12335f8d5e65f1d08'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
	wrestool -x -t 14 -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"
	icotool -x -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"_*_*_*.ico
}

package() {
	install -D -m755 irpf.sh "${pkgdir}/usr/bin/irpf"
	install -D -m644 irpf.desktop -t "${pkgdir}/usr/share/applications"
	install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 "IRPF${pkgver%%.*}"/{irpf,pgd-updater}.jar -t "${pkgdir}/usr/share/java/irpf"
	install -D -m644 "IRPF${pkgver%%.*}/Leia-me.htm" -t "${pkgdir}/usr/share/doc/irpf"
	cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/irpf"
	cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/"lib{,-modulos} "${pkgdir}/usr/share/java/irpf"
	ln -s ../../doc/irpf/help "${pkgdir}/usr/share/java/irpf/help"
	
	local _file
	local _res
	while read -r -d '' _file
	do
		_res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
		install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/irpf.png"
	done < <(find "IRPF${pkgver%%.*}" -maxdepth 1 -type f -name "IRPF${pkgver%%.*}.exe"_*_*_*_*_*x*x*.png -print0)
}
