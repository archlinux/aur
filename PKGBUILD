# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Erwin Van de Velde <erwin.vandevelde@gmail.com>

pkgname=rdiff-backup
pkgver=2.0.5
_commit=040f122a5b181d7e1894f1fda632a4742e0c87bb
pkgrel=3
pkgdesc='A utility for local/remote mirroring and incremental backups.'
arch=('x86_64')
url='https://www.nongnu.org/rdiff-backup/'
license=('GPL')
depends=('python-setuptools' 'librsync')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pylibacl' 'python-pyxattr')
optdepends=('python-pylibacl: access control list support'
            'python-pyxattr: extended attribute support')
source=("git+https://github.com/rdiff-backup/rdiff-backup.git#commit=$_commit?signed"
        git+https://github.com/rdiff-backup/rdiff-backup-filesrepo.git)
sha512sums=('SKIP'
            'SKIP')
validpgpkeys=('B572DE9BC6537B9D5A4735B114C2601BDCA52872'  # Andrew Ferguson
              '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub

build() {
  cd $pkgname
  python setup.py build
}

check() {
  fakeroot tar xf rdiff-backup-filesrepo/rdiff-backup_testfiles.tar
  cd $pkgname
  export PATH="$PWD/build/scripts-3.10:$PATH"
  export PYTHONPATH="$PWD/build/lib.linux-x86_64-3.10"
  python testing/commontest.py
  python testing/ctest.py
  python testing/timetest.py
  python testing/librsynctest.py || :  # https://github.com/rdiff-backup/rdiff-backup/issues/304
  python testing/statisticstest.py
  python testing/user_grouptest.py || :  # Missing user/group
  python testing/setconnectionstest.py
  python testing/iterfiletest.py
  python testing/longnametest.py
  python testing/robusttest.py
  python testing/connectiontest.py
  python testing/incrementtest.py
  python testing/hardlinktest.py
  python testing/eas_aclstest.py || :  # https://github.com/rdiff-backup/rdiff-backup/issues/370
  python testing/FilenameMappingtest.py
  python testing/fs_abilitiestest.py
  python testing/hashtest.py
  python testing/selectiontest.py || :  # Missing mknod'ed test files
  python testing/metadatatest.py
  python testing/rpathtest.py || :  # Permission difference
  python testing/rorpitertest.py
  python testing/rdifftest.py
  python testing/securitytest.py
  python testing/killtest.py
  python testing/backuptest.py
  python testing/comparetest.py
  python testing/regresstest.py
  python testing/restoretest.py
  python testing/cmdlinetest.py
}

package() {
  cd $pkgname
  python setup.py install --root="$pkgdir" -O1
}
