# Maintainer: James An <james@jamesan.ca>

_pkgname=hostmaster
pkgname=aegir-$_pkgname
pkgver=7.x_3.4
pkgrel=1
pkgdesc="mass Drupal hosting system - frontend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush>=7')

pkgver() {
    drush rl --default-major=7 --fields=version --field-labels=0 $_pkgname | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' '
}

prepare() {
    msg2 'Fetching hostmaster...'
    drush dl --default-major=7 $_pkgname --yes --drupal-project-rename=$_pkgname &>/dev/null

    msg2 'Fetching latest version of hostmaster extensions...'
    for TYPE in modules themes; do
        for DIR in $_pkgname/profiles/$_pkgname/$TYPE/*/*; do
            EXT=$(basename $DIR)
            VER_DO=$(drush rl --default-major=7 $EXT --fields=version,status --pipe |& grep -v -- '-dev' | grep Supported | head -n1 | cut -f1 -d,)
            VER_HM=$(grep 'version = ' $DIR/$EXT.info | tail -n1 | cut -f2 -d\")
            if [[ "$VER_HM" < "$VER_DO" ]]; then
                msg2 "  Fetching $EXT..."
                drush dl --default-major=7 $EXT --yes --destination=$TYPE &>/dev/null
            fi
        done
    done

    msg2 'Fetching devel and devel_debug_log (missing extension dependency)...'
    for EXT in devel devel_debug_log; do
        msg2 "  Fetching $EXT..."
        drush dl --default-major=7 $EXT --yes --destination=modules
    done
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

    msg2 'Fixing file permissions...'
    find "$pkgdir/usr/share/webapps/$_pkgname" -perm /u+w -exec chmod g+w {} +
    chown -R http:http "$pkgdir/usr/share/webapps/$_pkgname"
}
