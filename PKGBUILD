# Maintainer: ykahveci <aur at kahveci-sw dot de>

pkgname=restic-backup-scripts
pkgver=0.1.0
pkgrel=1
pkgdesc="Scripts and systemd timer for automatic system backups using restic"
arch=(any)
url="https://gitlab.kahveci-sw.de/ykahveci/restic-backup-scripts"
license=('GPL-2.0-only')
groups=()
depends=('bash' 'restic')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=('etc/restic-backup/exclude.txt'
        'etc/restic-backup/include.txt'
        'etc/restic-backup/restic.env')
options=()
install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
        ${pkgname}.sysusers
        ${pkgname}.tmpfiles)
noextract=()
sha256sums=('bbd06cc9d95c9de4c15b6060e25ad15f829052632a7634019715ccf15bd19592'
            'ed3d4217864cd1d34c82adbce5c964d2f3a96ab35a6ed11db10a5b2f7813796f'
            '4b7d714c2f7f8fb69ed42eae9391f526ddb65899524864432cec6a6cb3a1341f')

package() {
    pushd $srcdir/${pkgname}
    make DESTDIR="$pkgdir" PREFIX="/usr" install
    # Copy README.md to doc
    install -vDm 644 ./README.md $pkgdir/usr/share/doc/restic-backup-scripts/README.md
    popd
    # use systemd-sysusers to create system account for service
    install -vDm 644 ./${pkgname}.sysusers $pkgdir/usr/lib/sysusers.d/${pkgname%-git}.conf
    # use systemd-tmpfiles to set file ownership to dynamically created service account
    install -vDm 644 ./${pkgname}.tmpfiles $pkgdir/usr/lib/tmpfiles.d/${pkgname%-git}.conf
}
