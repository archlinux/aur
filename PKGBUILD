# Maintainer: Aman Gupta <aman.iv0012@gmail.com>

# TODO:
# 1. Add support for profilecli
# 2. Carry over CI Pipelines to build the package
# 3. Add Changelog to the package
# 4. Hashes to be changed to MD5

pkgname=pyroscope-bin
pkgver=1.13.0
pkgrel=1
pkgdesc='Continuous Profiling Platform. Debug performance issues down to a single line of code '
arch=('x86_64' 'aarch64')
url="https://pyroscope.io/"
_dl_url="https://github.com/grafana/pyroscope/"
license=('AGPL-3.0')
optdepends=('bcc-tools: required for ebpfspy')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=("etc/${pkgname%-bin}/server.yml" "etc/default/${pkgname%-bin}")
source=(
	"$pkgname-$pkgver-server.service::https://raw.githubusercontent.com/grafana/pyroscope/refs/heads/main/tools/packaging/pyroscope.service"
	"$pkgname-$pkgver-server.yml::https://raw.githubusercontent.com/grafana/pyroscope/refs/heads/main/cmd/pyroscope/pyroscope.yaml"
	"${pkgname%-bin}.sysusers"
	"${pkgname%-bin}.tmpfiles"
)
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${_dl_url}releases/download/v${pkgver}/pyroscope_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${_dl_url}releases/download/v${pkgver}/pyroscope_${pkgver}_linux_arm64.tar.gz")
options=(!debug)
b2sums=('6a16db9fd3e19c6163f4f12a9021041e2fa5389c8b842419d499bedec4379b805ec8601b176e31e772b8e2d5944f91a43bdb165b782bd73ca7140c57ceedfda5'
        '22c4abbac63f21bd3fbc354a5eeaff5b94a02ba102c1a983b7b9de57a3d014f8cdfc3cc7b4697622f56c0daa14326952a044307b8cc54ae4872811a4a44e3251'
        '948dc828f1b2e1068b45d298a073b4c0df4bb18138832c4d0cbcbd33d2f0b995fd37fa0b4ab5f057f30ea01f7b8c16652fc4c469e9262e9e1fde7c30ead62671'
        '068e5c7ca80e3111625e593a844bb6d3231a5a1273816bf975cd25f8a608fb6ce964e3bb16574bfd930d86189c59a441185f949763574edab5c4de99f80a4937')
b2sums_x86_64=('ecc9a996e02eb1075c642ab48a8814858f8df1c2e799768c064821cb361a6933d766edf40075da30130f200797e7a702070433a3a54bef60329e144d5deab559')
b2sums_aarch64=('d7497a0cc735d82651980b37bda6991529af9ad42354c1f412d744c013062fff8e4f4cc21f56683d94f32fe31ef6b4a1e2aa51db3fb879077e5a52c188ed1d0a')

package() {
	install -Dm644 "${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
	install -Dm644 "$pkgname-$pkgver-server.yml" "$pkgdir/etc/${pkgname%-bin}/config.yml"
	install -Dm644 "$pkgname-$pkgver-server.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}.service"
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc/default"
	touch "$pkgdir/etc/default/${pkgname%-bin}"
}
