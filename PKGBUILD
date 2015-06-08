# Maintainer: James An <james@jamesan.ca>

_pkgname=hostmaster
pkgname=aegir-$_pkgname
pkgver=7.x_3.0_beta2
pkgrel=1
pkgdesc="mass Drupal hosting system - frontend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')

pkgver() {
    drush rl --fields=version --field-labels=0 hostmaster | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' '
}

prepare() {
    msg2 'Fetching hostmaster...'
    drush dl $_pkgname --yes --drupal-project-rename=$_pkgname &>/dev/null

    msg2 'Fetching latest version of hostmaster extensions...'
    for TYPE in modules themes; do
        for DIR in $_pkgname/profiles/$_pkgname/$TYPE/*/*; do
            EXT=$(basename $DIR)
            VER_DO=$(drush rl $EXT --fields=version,status --pipe |& grep Supported | head -n1 | cut -f1 -d,)
            VER_HM=$(grep 'version = ' $DIR/$EXT.info | tail -n1 | cut -f2 -d\")
            if [[ "$VER_HM" < "$VER_DO" ]]; then
                drush dl $EXT --yes --destination=$TYPE &>/dev/null
            fi
        done
    done

    msg2 'Fetching devel and devel_debug_log (missing extension dependency)...'
    drush dl devel --yes --destination=modules &>/dev/null
    drush dl devel_debug_log --yes --destination=modules &>/dev/null
}

build() {
    msg2 'Merging extensions into hostmaster...'
    for TYPE in modules themes; do
        if [ -d $TYPE ]; then
            cp -r $TYPE/* $_pkgname/sites/all/$TYPE
        fi
    done
    mkdir -m755 $_pkgname/sites/all/drush
}

package() {
    install -dm755 "$pkgdir/usr/share/webapps"
    cp -r $_pkgname "$pkgdir/usr/share/webapps"

    install -Dm644 <( ) "$pkgdir/usr/share/webapps/$_pkgname/sites/all/drush/drushrc.php"
    install -Dm644 <( ) "$pkgdir/usr/share/webapps/$_pkgname/sites/sites.php"
    chown -R 696:http "$pkgdir/usr/share/webapps"
}
