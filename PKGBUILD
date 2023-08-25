# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="modsecurity-comodo"
pkgver=1.235
pkgrel=1
pkgdesc="Free ModSecurity Rules from Comodo"
url="https://waf.comodo.com"
license=("proprietary")
arch=("any")
depends=("modsecurity-crs"
         "libmodsecurity"
         "nginx")
# signup for free at https://accounts.comodo.com/cwaf/management/signup
# download from https://waf.comodo.com/
# adjust $pkgver and $sha256sums if needed
source=("download-guide.png"
        "local://cwaf_rules_nginx_3-$pkgver.tgz")
sha256sums=('c4a8c462ec49c013f6bcbbedddab009157a32d55f5f476e2abf9f14756f2e1fc'
            'af4978c344009bb69dba28cfa7051215f29887839c6ab4c26cad5111a5e80759')
backup=("etc/modsecurity/comodo/userdata_bl_referers"
        "etc/modsecurity/comodo/userdata_wl_agents"
        "etc/modsecurity/comodo/userdata_wl_IPs"
        "etc/modsecurity/comodo/userdata_bl_agents"
        "etc/modsecurity/comodo/userdata_wl_content_type"
        "etc/modsecurity/comodo/userdata_wl_extensions"
        "etc/modsecurity/comodo/userdata_wl_URLs"
        "etc/modsecurity/comodo/userdata_bl_headers"
        "etc/modsecurity/comodo/userdata_bl_URLs"
        "etc/modsecurity/comodo/userdata_bl_domains"
        "etc/modsecurity/comodo/userdata_wl_domains"
        "etc/modsecurity/comodo/userdata_login_pages"
        "etc/modsecurity/comodo/userdata_bl_extensions"
        "etc/modsecurity/comodo/userdata_bl_cookies"
        "etc/modsecurity/comodo/userdata_bl_IPs"
        "etc/modsecurity/comodo/userdata_wl_methods")
noextract=("cwaf_rules_nginx_3-$pkgver.tgz")
options=("!strip")
install="modsecurity-comodo.install"

prepare(){
 install -d "cwaf_rules_nginx_3-$pkgver"
 tar xf "cwaf_rules_nginx_3-$pkgver.tgz" --directory="cwaf_rules_nginx_3-$pkgver"
}

package(){
 cd "cwaf_rules_nginx_3-$pkgver"
 install -d "$pkgdir/etc/modsecurity/comodo" "$pkgdir/usr/share/modsecurity/comodo"
 find . -type f -name "userdata*" -exec mv {} "$pkgdir/etc/modsecurity/comodo" \;
 find . -type f -exec mv {} "$pkgdir/usr/share/modsecurity/comodo" \;
 cd "$pkgdir/etc/modsecurity/comodo"
 for _file in userdata*; do
  ln -s "/etc/modsecurity/comodo/$_file" "$pkgdir/usr/share/modsecurity/comodo/$_file"
 done
}
