# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor K1412 <jonathan@opensides.be>

pkgname="fusiondirectory-plugins"
pkgver=1.4
pkgrel=1
pkgdesc="FusionDirectory core plugins"
url="http://fusiondirectory.org/"
license=("GPL2")
arch=("any")
depends=("fusiondirectory")
makedepends=("schema2ldif")
source=("$pkgname-$pkgver.tar.gz::https://github.com/fusiondirectory/$pkgname/archive/refs/tags/fusiondirectory-$pkgver.tar.gz"
        #"WebAuthn.tar.gz::https://github.com/lbuchs/WebAuthn/archive/refs/heads/master.tar.gz"
        #"otphp.tar.gz::https://github.com/Spomky-Labs/otphp/archive/refs/tags/v10.0.1.tar.gz"
       )
b2sums=('e1902641e23a550ad0908d40efac2c55a7085693e5a424f7fa21257d1aa74799f2956451eb822e03f39eeaf27375c35fdb91dce18627a7b12201943226d26b21')
            #'78a6f197960e64d3a82de95c2264113bb7140df65c255f57786d8c248bdf1125'
            #'54f22631b429ae59c9a1fbe6ebb176bb55a4e1a4778110321acca6e48fe65fff'
install="$pkgname.install"
options=("!strip")

package(){
 cd "$pkgname-fusiondirectory-$pkgver"
 # remove hidden folders and files, but not the current directory (".")
 rm -r .[!.]*
 find . -maxdepth 1  -type f -exec rm {} \;
 # one plugin per folder
 plugins=(*)
 # broken plugins
 pluginsToSkip=(
  #"mixedgroups" # Duplicate attributeType: "1.3.6.1.1.1.1.2"
  #"webauthn" # Cannot initiate OTPHP/FactoryInterface class
 )
 # iterate for every plugin folder
 for plugin in "${plugins[@]}"; do
  if echo ${pluginsToSkip[@]} | grep -q -w "$plugin"; then
   echo "Skipping   plugin $plugin"
  else
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
  fi
 done
 # remove problematic schemas
 schemasToRemove=(
  "supann_2009.schema" # Duplicate attributeType: "1.3.6.1.4.1.7135.1.2.1.1"
 )
 for schema in "${schemasToRemove[@]}"; do
  schemaFile="$pkgdir/etc/openldap/schema/fusiondirectory/$schema"
  if [ -f "$schemaFile" ]; then
   rm "$schemaFile"
 fi
 done
 # convert schema to ldif
 # import of ldif files will be done by end user
 if [ -x "$(command -v schema2ldif)" ]; then
  for file in "$pkgdir/etc/openldap/schema/fusiondirectory"/*.schema; do
   schema2ldif "$file" > "${file/.schema/.ldif}"
  done
 fi
 # extract third party packages
 #echo "Installing third party packages for webauthn"
 #tar -xzf "$srcdir/WebAuthn.tar.gz" --strip-components=1 "WebAuthn-master/src/"
 #mkdir "$pkgdir/usr/share/webapps/fusiondirectory/include/lbuchs"
 #mv "src" "$pkgdir/usr/share/webapps/fusiondirectory/include/lbuchs/WebAuthn"
 #tar -xzf "$srcdir/otphp.tar.gz" --strip-components=1 "otphp-10.0.1/src/"
 #mv "src" "$pkgdir/usr/share/webapps/fusiondirectory/include/otphp"
}
