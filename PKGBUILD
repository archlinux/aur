# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=linux-dash
pkgver=2.0
pkgrel=1
pkgdesc="A drop-in, low-overhead monitoring web dashboard for a linux machine."
arch=('any')
url="https://github.com/afaqurk/linux-dash"
license=('MIT')
depends=('php')
optdepends=('apache: webserver can host linux-dash'
            'nginx: webserver can host linux-dash'
            'node: linux-dash now works with node.js')
source=(https://github.com/afaqurk/linux-dash/archive/$pkgver.tar.gz)
sha256sums=('f7342807ecadd22410614336378311a356e04a18569f64935ea67b9bc27ccd56')

package(){
  cd "$srcdir/$pkgname-$pkgver"

  # apache config stolen from adminer:
  cat > apache.example.conf <<EOF
  Alias /${pkgname} "/usr/share/webapps/${pkgname}"
  <Directory "/usr/share/webapps/${pkgname}">
    AllowOverride All
    Options FollowSymlinks
    Require all granted
    php_admin_value open_basedir "/srv/:/tmp/:/usr/share/webapps/:/etc/webapps:/usr/share/pear/"
  </Directory>
EOF

  #license
  install -Dm0644 LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  #doc
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md

  # TODO: check if apache installed first
  install -Dm0644 apache.example.conf "$pkgdir"/etc/httpd/conf/extra/httpd-"$pkgname".conf

  _install_dir="$pkgdir"/usr/share/webapps/"$pkgname"
  install -Dm0644 index.html "$_install_dir"/index.html
  install -Dm0644 favicon.ico "$_install_dir"/favicon.ico
  mkdir -p "$_install_dir"/css "$_install_dir"/img "$_install_dir"/js "$_install_dir"/server "$_install_dir"/templates
  cp -r css/* "$_install_dir"/css/
  cp -r img/* "$_install_dir"/img/
  cp -r js/* "$_install_dir"/js/
  cp -r server/* "$_install_dir"/server/
  cp -r templates/* "$_install_dir"/templates/

  # set permissions
  find "$_install_dir" -type d -exec chmod 0755 {} \;
  find "$_install_dir" -type f -exec chmod 0644 {} \;

}
