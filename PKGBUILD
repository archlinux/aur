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
pkgrel=2
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
    'http://ftp.drupal.org/files/projects/registry_rebuild-7.x-2.2.tar.gz'
    'http://ftp.drupal.org/files/projects/drush-vagrant-7.x-2.0-rc4.tar.gz'
    'http://ftp.drupal.org/files/projects/drush_entity-7.x-5.0-alpha2.tar.gz'
    'buildmanager::git+https://github.com/WhiteHouse/buildmanager.git'
    'drushsubtree::git+https://github.com/WhiteHouse/drushsubtree.git'
)
md5sums=(
    'f68c7407446bc4dfe95fbe1741928a15'
    '29bd5f0bab1911aca72708165590fd94'
    '0ecb568037d3425c25f971234359c4eb'
    '44401d4fdc8bd5b18919f1db17716664'
    '6057703bd4a5bec81e397e19602e2756'
    '8d735f9e8f864424f292d4866a70b8f1'
    'b121cc7779ba3fd346e4ca90fd6db19a'
    'SKIP'
    'SKIP'
)


package_drush-aegir-up() {
    pkgver=2.0_rc3
    pkgdesc='Blueprint provider for Drush Vagrant to build a local Aegir VMs'
    url='https://www.drupal.org/project/aegir_up'
    depends=('drush-vagrant')
    _dirname=aegir-up
    _package
}
package_drush-drupal-up() {
    pkgver=1.0_beta3
    pkgdesc='Blueprint provider for Drush Vagrant to build local Drupal VMs'
    url='https://www.drupal.org/project/drupal_up'
    depends=('drush-vagrant')
    _dirname=drupal-up
    _package
}
package_drush-hosts() {
    pkgver=1.1
    pkgdesc='Simple commands for managing entries in /etc/hosts'
    url='https://www.drupal.org/project/drush_hosts'
    depends=('drush')
    _dirname=drush-hosts
    _package
}
package_drush-registry-rebuild() {
    pkgver=2.2
    pkgdesc='Simple command for rebuilding a Drupal site system registry'
    url='https://www.drupal.org/project/registry_rebuild'
    depends=('drush')
    _dirname=registry_rebuild
    _package
}
package_drush-vagrant() {
    pkgver=2.0_rc4
    pkgdesc='Vagrant templating framework to use Vagrant blueprints to build and test projects like Drupal and Puppet modules'
    url='https://www.drupal.org/project/drush-vagrant'
    depends=('drush-hosts' 'vagrant' 'virtualbox')
    optdepends=('nfs-utils: NFS support')
    _dirname=drush-vagrant
    _package
}
package_drush-entity() {
    pkgver=5.0_alpha2
    pkgdesc='Query and manipulate entities directly.'
    url='https://www.drupal.org/project/drush-entity'
    depends=('drush')
    _dirname=drush_entity
    _package
}
package_drush-buildmanager() {
    pkgver="$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
    pkgdesc='Drush Make wrapper to simplify maintaining Drupal builds.'
    url='https://github.com/whitehouse/buildmanager'
    depends=('drush')
    _dirname=buildmanager
    _package
}
package_drush-subtree() {
    pkgver="$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
    pkgdesc='Integrate git-subtree with Drush Make for automated and efficient Drupal builds.'
    url='https://github.com/whitehouse/drushsubtree'
    depends=('drush-buildmanager')
    _dirname=drushsubtree
    _package
}

_package() {
    cd $_dirname

    [ -f LICENSE.txt ] && rm LICENSE.txt
    for doc in docs {README,TODO}{,.{md,txt,html}}; do
        [ -d "$doc" -o -f "$doc" ] && {
            install -dm755 "$pkgdir/usr/share/doc/$pkgname"
            cp -R "$doc" "$pkgdir/usr/share/doc/$pkgname/$doc"
        }
    done

    msg2 'Adding main files'
    # Ignore dot-files at the root directory of the extension (e.g. the .git dot-folder).
    install -m755 -d "$pkgdir/usr/share/webapps/drush/commands/$_dirname"
    cp -a * "$pkgdir/usr/share/webapps/drush/commands/$_dirname"
}
