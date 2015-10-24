# Maintainer: wolftankk <wolftankk@gmail.com>
pkgname=rockhopper
pkgver=0.2.b1
pkgrel=020
pkgdesc="IPsec/IKEv2-based VPN software for Linux"
url="http://rockhoppervpn.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libcap' 'openssl' 'libxml2' 'sqlite' 'perl-xml-libxml' 'perl-libwww' 'perl-switch' 'gtk2-perl')
#optdepends=()
install=$pkgname.install
makedepends=('gcc')

source=(
	"rockhopper.service"
	"http://sourceforge.net/projects/rockhoppervpn/files/rockhopper-$pkgver-$pkgrel.tgz"
)

sha256sums=('6631265db9c1709347423f550847488adea59a1f7f371d7b9a8378563520a4fd'
            'fb70c194483adacf3f431f28948d7564e5e1769098d39a01739d5f0c5e1eb382'
            'eb24d740983624a982af313551ac9ba240b024edb6d7f40c94e972a5a4f08447')

_build_app() {
	local src=$1
	cd $src
	make clean -f Makefile
	make all -f Makefile
}

#build() {
#	_pkgsrc="$srcdir/rockhopper-$pkgver-$pkgrel"
#
#	msg2 "Configuring modules"
#	#build rhptrace tools
#	_build_app $_pkgsrc/rhptrace/tool
#
#	#build rhptrace lib
#	_build_app $_pkgsrc/rhptrace/lib
#
#	#build librhpbfltr
#	_build_app $_pkgsrc/rockhopper/librhpbfltr/build
#
#	#build librhpblog_def
#	_build_app $_pkgsrc/rockhopper/librhplog_def/build
#
#	#build librhpcert def
#	_build_app $_pkgsrc/rockhopper/librhpcert_openssl/build
#
#	#build librhpcrypto def
#	_build_app $_pkgsrc/rockhopper/librhpcrypto_openssl/build
#
#	#build librhpesp def
#	_build_app $_pkgsrc/rockhopper/librhpesp_def/build
#
#	#peapa
#	_build_app $_pkgsrc/rockhopper/librhpeapa_def/build
#
#	#peaps
#	_build_app $_pkgsrc/rockhopper/librhpeaps_def/build
#
#	#tuntap tool
#	_build_app $_pkgsrc/rockhopper/tuntap_tool/build
#
#	#tuntap cfg
#	_build_app $_pkgsrc/rockhopper/tuntap_cfg/build
#
#	#log tool
#	_build_app $_pkgsrc/rockhopper/log_tool/build
#
#	#build rockhopper
#	_build_app $_pkgsrc/rockhopper/app/build
#
#
#}

package() {
	_pkgsrc="$srcdir/rockhopper-$pkgver-$pkgrel"

	#install
	install -m0755 -D "$_pkgsrc"/rhptrace/tool/rhp_trace "$pkgdir"/usr/local/sbin/rhp_trace
	install -m0644 -D "$_pkgsrc"/rhptrace/lib/librhptrace.so "$pkgdir"/usr/lib/librhptrace.so
	install -m0644 -D "$_pkgsrc"/rockhopper/librhpbfltr/build/librhpbfltr.so "$pkgdir"/usr/lib/librhpbfltr.so
	install -m0644 -D "$_pkgsrc"/rockhopper/librhplog_def/build/librhplog.so "$pkgdir"/usr/lib/librhplog.so
	install -m0644 -D "$_pkgsrc"/rockhopper/librhpcert_openssl/build/librhpcert.so "$pkgdir"/usr/lib/librhpcert.so
	install -m0644 -D "$_pkgsrc"/rockhopper/librhpcrypto_openssl/build/librhpcrypto.so "$pkgdir"/usr/lib/librhpcrypto.so
	install -m0644 -D "$_pkgsrc"/rockhopper/librhpesp_def/build/librhpesp.so "$pkgdir"/usr/lib/librhpesp.so
	install -m0644 -D "$_pkgsrc"/rockhopper/librhpeapa_def/build/librhpeapa.so "$pkgdir"/usr/lib/librhpeapa.so
	install -m0644 -D "$_pkgsrc"/rockhopper/librhpeaps_def/build/librhpeaps.so "$pkgdir"/usr/lib/librhpeaps.so

	install -m0700 -D "$_pkgsrc"/rockhopper/app/build/rockhopperd "$pkgdir"/usr/bin/rockhopperd

	#mng cmd ools
	install -m0755 -D "$_pkgsrc"/rockhopper/mng_cmd_tools/rockhopper.pl "$pkgdir"/usr/bin/rockhopper
	install -m0755 -D "$_pkgsrc"/rockhopper/mng_cmd_tools/rockhopper_log.pl "$pkgdir"/usr/bin/rockhopper_log
	install -m0700 -D "$_pkgsrc"/rockhopper/tuntap_tool/build/rhp_tuntap_tool "$pkgdir"/usr/bin/rhp_tuntap_tool
	install -m0755 -D "$_pkgsrc"/rockhopper/tuntap_tool/rhp_tuntap_clean.pl "$pkgdir"/usr/bin/rhp_tuntap_clean

	install -m0700 -D "$_pkgsrc"/rockhopper/log_tool/build/rhp_logtool "$pkgdir"/usr/bin/rhp_logtool
	install -m0755 -D "$_pkgsrc"/rockhopper/gtk2_perl_vpn_client/rhp_client.pl "$pkgdir"/usr/bin/rhp_client

	install -m0640 -D "$_pkgsrc"/installer/protected.xml "$pkgdir"/var/lib/rhpprotected/config/protected.xml
	install -m0640 -D "$_pkgsrc"/installer/auth.xml "$pkgdir"/var/lib/rhpprotected/config/auth.xml
	install -m0640 -D "$_pkgsrc"/installer/policy.xml "$pkgdir"/var/lib/rhpprotected/config/policy.xml
	install -m0640 -D "$_pkgsrc"/installer/main.xml "$pkgdir"/var/lib/rhpprotected/config/main.xml

	#web
	install -d "$pkgdir"/var/lib/rhpmain/www
	cp -a "$_pkgsrc"/rockhopper/web_mng "$pkgdir"/var/lib/rhpmain/www

	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_netmng "$pkgdir"/var/lib/rhpprotected/script/rhp_netmng

	install -Dm4755 "$_pkgsrc"/rockhopper/tuntap_cfg/build/rhp_tuntap_cfg "$pkgdir"/var/lib/rhpprotected/script/rhp_tuntap_cfg
	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_mng "$pkgdir"/var/lib/rhpprotected/script/rhp_mng

	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_cfg_cert_file "$pkgdir"/var/lib/rhpprotected/script/rhp_cfg_cert_file

	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_cfg_bkup_main "$pkgdir"/var/lib/rhpmain/script/rhp_cfg_bkup_main
	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_event_log_convert "$pkgdir"/var/lib/rhpmain/script/rhp_event_log_convert
	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_cfg_bkup_syspxy "$pkgdir"/var/lib/rhpprotected/script/rhp_cfg_bkup_syspxy
	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_restore_cfg "$pkgdir"/var/lib/rhpprotected/script/rhp_restore_cfg
	install -Dm0700 "$_pkgsrc"/rockhopper/script/rhp_upgrade_conf.pl "$pkgdir"/var/lib/rhpprotected/script/rhp_upgrade_conf.pl

	install -Dm0700 "$_pkgsrc"/installer/systemd_rhp_ext "$pkgdir"/var/lib/rhpprotected/script/rhp_systemd_ext
	install -Dm0400 "$_pkgsrc"/installer/systemd_rhp_env "$pkgdir"/var/lib/rhpprotected/script/rhp_systemd_env

	install -Dm644 ../rockhopper.service "$pkgdir"/usr/lib/systemd/system/rockhopper.service
}
