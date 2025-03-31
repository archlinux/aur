# Maintainer: Aman Gupta <aman.iv0012@gmail.com>

# TODO:
# 1. Add support for profilecli
# 2. Carry over CI Pipelines to build the package
# 3. Add Changelog to the package
# 4. Hashes to be changed to MD5
# 5. Backup existing confs

pkgname=pyroscope-bin
pkgver=1.13.1
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
b2sums_x86_64=('419c2cfca0a64800f95b45dc72b5e436453892fbc3719d35678677f77fe3fc9a67e8ac0abf22140b1b9f64d91a609e5f9c83063d65dcf5908eb32c38c782f0fe')
b2sums_aarch64=('65deb29855a747266104953616ebe63ad6e5622a2701cce0fee323220a005b36f8f24ed62b2af5a71d6e8ae6fe3d585c11fcf3c058ba6080002e70894b1b75bd')

package() {
	install -Dm644 "${pkgname%-bin}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-bin}.conf"
	install -Dm644 "${pkgname%-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
	install -Dm644 "$pkgname-$pkgver-server.yml" "$pkgdir/etc/${pkgname%-bin}/config.yml"
	install -Dm644 "$pkgname-$pkgver-server.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-bin}.service"
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc/default"
	touch "$pkgdir/etc/default/${pkgname%-bin}"
}
