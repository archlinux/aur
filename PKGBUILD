# Maintainer: James An <james@jamesan.ca>

pkgname=(
    'drush-aegir-up'
    'drush-drupal-up'
    'drush-hosts'
    'drush-registry-rebuild'
    'drush-vagrant'
    'drush-entity'
    'drush-buildmanager'
    'drush-subtree'
)
pkgbase='drush-extensions'
pkgver='7.x'
pkgrel=4
pkgdesc="Various Drush extensions"
arch=('any')
url='http://github.com/drush-ops/drush/'
license=('GPL')
groups=('drupal')
depends=('drush')
makedepends=('git')
install=install
source=(
    'install'
    'http://ftp.drupal.org/files/projects/aegir-up-7.x-2.0-rc3.tar.gz'
    'http://ftp.drupal.org/files/projects/drupal-up-7.x-1.0-beta3.tar.gz'
    'http://ftp.drupal.org/files/projects/drush-hosts-7.x-1.1.tar.gz'
    'http://ftp.drupal.org/files/projects/registry_rebuild-7.x-2.3.tar.gz'
    'http://ftp.drupal.org/files/projects/drush-vagrant-7.x-2.0-rc4.tar.gz'
    'http://ftp.drupal.org/files/projects/drush_entity-7.x-5.0-alpha2.tar.gz'
    'buildmanager'::'git+https://github.com/WhiteHouse/buildmanager.git'
    'drushsubtree'::'git+https://github.com/WhiteHouse/drushsubtree.git'
)
md5sums=('f68c7407446bc4dfe95fbe1741928a15'
         '29bd5f0bab1911aca72708165590fd94'
         '0ecb568037d3425c25f971234359c4eb'
         '44401d4fdc8bd5b18919f1db17716664'
         'fb39676f0bbb24a13ceb52232af56dd8'
         '8d735f9e8f864424f292d4866a70b8f1'
         'b121cc7779ba3fd346e4ca90fd6db19a'
         'SKIP'
         'SKIP')

package_drush-extensions() {
  declare -A _pkgname=(
    ['drush-aegir-up']=aegir-up
    ['drush-drupal-up']=drupal-up
    ['drush-hosts']=drush-hosts
    ['drush-registry-rebuild']=registry_rebuild
    ['drush-vagrant']=drush-vagrant
    ['drush-entity']=drush_entity
    ['drush-buildmanager']=buildmanager
    ['drush-subtree']=drushsubtree
  )

  declare -A _pkgver=(
    ['drush-aegir-up']=2.0-rc3
    ['drush-drupal-up']=1.0-beta3
    ['drush-hosts']=1.1
    ['drush-registry-rebuild']=2.3
    ['drush-vagrant']=2.0-rc4
    ['drush-entity']=5.0-alpha2
    ['drush-buildmanager']=20140613.115
    ['drush-subtree']=20141007.131
  )

  declare -A _pkgdesc=(
    ['drush-aegir-up']='Blueprint provider for Drush Vagrant to build a local Aegir VMs'
    ['drush-drupal-up']='Blueprint provider for Drush Vagrant to build local Drupal VMs'
    ['drush-hosts']='Simple commands for managing entries in /etc/hosts'
    ['drush-registry-rebuild']='Simple command for rebuilding a Drupal site system registry'
    ['drush-vagrant']='Vagrant templating framework to use Vagrant blueprints to build and test projects like Drupal and Puppet modules'
    ['drush-entity']='Query and manipulate entities directly.'
    ['drush-buildmanager']='Drush Make wrapper to simplify maintaining Drupal builds.'
    ['drush-subtree']='Integrate git-subtree with Drush Make for automated and efficient Drupal builds.'
  )

  declare -A _url=(
    ['drush-aegir-up']='https://www.drupal.org/project/aegir_up'
    ['drush-drupal-up']='https://www.drupal.org/project/drupal_up'
    ['drush-hosts']='https://www.drupal.org/project/drush_hosts'
    ['drush-registry-rebuild']='https://www.drupal.org/project/registry_rebuild'
    ['drush-vagrant']='https://www.drupal.org/project/drush-vagrant'
    ['drush-entity']='https://www.drupal.org/project/drush_entity'
    ['drush-buildmanager']='https://github.com/whitehouse/buildmanager'
    ['drush-subtree']='https://github.com/whitehouse/drushsubtree'
  )

  declare -A _depends=(
    ['drush-aegir-up']='drush-vagrant'
    ['drush-drupal-up']='drush-vagrant'
    ['drush-hosts']='drush'
    ['drush-registry-rebuild']='drush'
    ['drush-vagrant']='drush-hosts vagrant virtualbox'
    ['drush-entity']='drush'
    ['drush-buildmanager']='drush'
    ['drush-subtree']='drush-buildmanager'
  )

  declare -A _optdepends=(
    ['drush-aegir-up']=''
    ['drush-drupal-up']=''
    ['drush-hosts']=''
    ['drush-registry-rebuild']=''
    ['drush-vagrant']='nfs-utils: NFS support'
    ['drush-entity']=''
    ['drush-buildmanager']=''
    ['drush-subtree']=''
  )

  pkgname=$1
  _pkgname="${_pkgname[$pkgname]}"
  pkgver="7.x-${_pkgver[$pkgname]//-/_}"
  pkgdesc="${_pkgdesc[$pkgname]}"
  url="${_url[$pkgname]}"
  read -a depends <<< "${depends[*]} ${_depends[$pkgname]}"
  [ -n "${_optdepends[$pkgname]}" ] && optdepends=("${_optdepends[$pkgname]}")

  cd $_pkgname

  # Remove license folder since all extensions must be licensed under the GPL2+.
  [ -f LICENSE.txt ] && rm LICENSE.txt

  # Move documentation into the shared doc folder.
  for doc in docs {README,TODO}{,.{md,txt,html}}; do
      [ -d "$doc" -o -f "$doc" ] && {
          install -dm755 "$pkgdir/usr/share/doc/$pkgname"
          cp -R "$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
      }
  done

  # Dot files, like .git, are ignored as dotglob is never set.
  install -dm755 "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
  cp -a * "$pkgdir/usr/share/webapps/drush/commands/$_pkgname"
}

# Instantiate packaging function using the system
for _pkgname in "${pkgname[@]}"; do
  eval "package_$_pkgname() {
    package_$pkgbase $_pkgname
  }"
done
