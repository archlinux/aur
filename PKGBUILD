# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor K1412 <jonathan@opensides.be>

pkgname="fusiondirectory-plugins"
pkgver=1.4.dev
pkgrel=2
_commit="ffbf0f994950abac4a411b7840fcbcc614db9692"
pkgdesc="FusionDirectory core plugins"
url="http://fusiondirectory.org/"
license=("GPL2")
arch=("any")
depends=("fusiondirectory")
source=("https://github.com/fusiondirectory/fusiondirectory-plugins/archive/$_commit.tar.gz")
sha256sums=('dcef93d300e78328849bcaa1fbc7d1e8354f0cb3edf5ce088b05b210d93b5aad')
install="$pkgname.install"
options=("!strip")

package(){
 cd "$pkgname-$_commit"
 # remove hidden folders and files, but not the current directory (".")
 rm -r .[!.]*
 find . -maxdepth 1  -type f -exec rm {} \;
 # iterate for every plugin folder
 plugins=(*)
 for plugin in "${plugins[@]}"; do
  echo "Installing plugin $plugin"
  cd "$plugin"
  ################################ /etc/openldap/schema/fusiondirectory
  if [ -d "contrib/openldap" ]; then
   mkdir -p "$pkgdir/etc/openldap/schema/fusiondirectory"
   cp -a "contrib/openldap"/* "$pkgdir/etc/openldap/schema/fusiondirectory"
  fi
  ################################ /usr/share/webapps/fusiondirectory/ihtml
  if [ -d "ihtml/themes" ]; then
   # recreate existing folder structure in target directory and copy files
   find "ihtml/themes" -type d -exec mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/{}" \;
   find "ihtml/themes" -type f -exec mv -n '{}' "$pkgdir/usr/share/webapps/fusiondirectory/{}" \;
   rm -r "ihtml/themes"
  fi
  ################################ /usr/share/webapps/fusiondirectory/html
  if [ -d "html" ]; then
   find "html" -maxdepth 1 -type f -iname "*.php" -exec mv {} "$pkgdir/usr/share/webapps/fusiondirectory/html" \;
   if [ -d "html/themes" ]; then
    # recreate existing folder structure in target directory and copy files
    find "html/themes" -type d -exec mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/{}" \;
    find "html/themes" -type f -exec mv -n '{}' "$pkgdir/usr/share/webapps/fusiondirectory/{}" \;
    rm -r "html/themes"
   fi
   if [ -d "html/plugins" ]; then
    mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/html/plugins/$plugin"
    if [ "$plugin" == "applications" ] || [ "$plugin" == "fusioninventory" ]; then
     mv "html/plugins"/* "$pkgdir/usr/share/webapps/fusiondirectory/html/plugins"
    else
     mv "html/plugins"/* "$pkgdir/usr/share/webapps/fusiondirectory/html/plugins/$plugin"
    fi
    rm -r "html/plugins"
   fi
   # check if there is something left
   if [ "$(ls "html" | wc -l)" -gt 0 ]; then
    mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/html/plugins/$plugin"
    cp -a "html"/* "$pkgdir/usr/share/webapps/fusiondirectory/html/plugins/$plugin"
   fi
  fi
  ################################ /usr/share/webapps/fusiondirectory/include
  if [ -d "include" ]; then
   mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/include"
   cp -a "include"/* "$pkgdir/usr/share/webapps/fusiondirectory/include"
  fi
  ################################ /usr/share/webapps/fusiondirectory/locale
  if [ -d "locale" ]; then
   mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/locale/plugins/$plugin/locale"
   cp -a "locale"/* "$pkgdir/usr/share/webapps/fusiondirectory/locale/plugins/$plugin/locale"
  fi
  ################################ /usr/share/webapps/fusiondirectory/plugins/admin
  if [ -d "admin" ]; then
   mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/plugins/admin"
   cp -a "admin"/* "$pkgdir/usr/share/webapps/fusiondirectory/plugins/admin"
  fi
  ################################ /usr/share/webapps/fusiondirectory/plugins/addons
  if [ -d "addons" ]; then
   mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/plugins/addons"
   cp -a "addons"/* "$pkgdir/usr/share/webapps/fusiondirectory/plugins/addons"
  fi
  ################################ /usr/share/webapps/fusiondirectory/plugins/config
  if [ -d "config" ]; then
   mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/plugins/config"
   cp -a "config"/* "$pkgdir/usr/share/webapps/fusiondirectory/plugins/config"
  fi
  ################################ /usr/share/webapps/fusiondirectory/plugins/personal
  if [ -d "personal" ]; then
   mkdir -p "$pkgdir/usr/share/webapps/fusiondirectory/plugins/personal"
   cp -a "personal"/* "$pkgdir/usr/share/webapps/fusiondirectory/plugins/personal"
  fi
  # go back to main plugin folders
  cd ..
 done
}
