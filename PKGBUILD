# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Erwin Van de Velde <erwin.vandevelde@gmail.com>

pkgname=rdiff-backup
pkgver=2.2.5
pkgrel=4
pkgdesc="Reverse differential backup tool, over a network or locally"
arch=(x86_64)
url="https://github.com/rdiff-backup/rdiff-backup"
license=(GPL)
depends=(
  glibc
  librsync
  procps-ng
  python
  python-psutil
  python-yaml
)
makedepends=(
  asciidoctor
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pylibacl
  python-pyxattr
)
optdepends=(
  'python-pylibacl: access control list support'
  'python-pyxattr: extended attribute support'
)

_rdiff_backup_filesrepo_hash=6139d14cd60e62ded4281a30e1d64b66d8a42797

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "rdiff-backup-filesrepo-$_rdiff_backup_filesrepo_hash.tar.gz::https://github.com/rdiff-backup/rdiff-backup-filesrepo/archive/$_rdiff_backup_filesrepo_hash.tar.gz"
  "0001-Fix-action-list-increments-regex-893.patch"
  "0002-Fix-timezone-for-Russia-Co-905.patch"
)
sha256sums=(
  '6ca47fcc81b4886a862e292f189f630b39e4523fc1c76c611ed40e92e4684e65'
  '96395a278b0b2b23a2005449ab50a771cdd168683e5942bfcfa3d04f5980c9f2'
  'fcb0f78eff81819b5f75428f427e5ef4624641328a6ac0a5450c9d0632790f90'
  'd3baee3e0f324f0af8e9818a6424aaf4d63b54b0459ca8264cd2fb085025d9d5'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/0001-Fix-action-list-increments-regex-893.patch"
  patch --forward --strip=1 --input="$srcdir/0002-Fix-timezone-for-Russia-Co-905.patch"
}

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  fakeroot tar --extract \
    --file "$srcdir/rdiff-backup-filesrepo-$_rdiff_backup_filesrepo_hash/rdiff-backup_testfiles.tar" \
    --directory "$srcdir"

  python_version=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

  python -m installer --destdir=test-install dist/*.whl
  export PATH="$PWD/test-install/usr/bin:$PATH"
  export PYTHONPATH="$PWD/test-install/usr/lib/python$python_version/site-packages"

  # Must be the first command to setup the test environment
  python testing/commontest.py

  python testing/action_backuprestore_test.py --verbose --buffer
  python testing/action_calculate_test.py --verbose --buffer
  python testing/action_compare_test.py --verbose --buffer
  python testing/action_complete_test.py --verbose --buffer
  python testing/action_list_test.py --verbose --buffer
  python testing/action_regress_test.py --verbose --buffer
  python testing/action_remove_test.py --verbose --buffer
  python testing/action_test_test.py --verbose --buffer
  python testing/action_verify_test.py --verbose --buffer
  # # sh ./testing/verbosity_actions_test.sh 9 --verbose --buffer  # Requires coverage
  python testing/readonly_actions_test.py --verbose --buffer
  python testing/api_test.py --verbose --buffer
  python testing/location_map_filenames_test.py --verbose --buffer
  python testing/location_map_hardlinks_test.py --verbose --buffer
  python testing/location_lock_test.py --verbose --buffer
  python testing/utils_simpleps_test.py --verbose --buffer
  python testing/ctest.py --verbose --buffer
  python testing/timetest.py --verbose --buffer
  python testing/librsynctest.py --verbose --buffer
  python testing/statisticstest.py --verbose --buffer
  # python testing/user_grouptest.py --verbose --buffer  # Missing user/group
  python testing/setconnectionstest.py --verbose --buffer
  python testing/iterfiletest.py --verbose --buffer
  python testing/longnametest.py --verbose --buffer
  python testing/robusttest.py --verbose --buffer
  python testing/connectiontest.py --verbose --buffer
  python testing/incrementtest.py --verbose --buffer
  python testing/hardlinktest.py --verbose --buffer
  # python testing/eas_aclstest.py --verbose --buffer  # Fails on tmpfs
  python testing/FilenameMappingtest.py --verbose --buffer
  # python testing/fs_abilitiestest.py --verbose --buffer  # Fails on tmpfs
  python testing/hashtest.py --verbose --buffer
  # python testing/selectiontest.py --verbose --buffer  # Missing mknod'ed test files
  python testing/metadatatest.py --verbose --buffer
  # python testing/rpathtest.py --verbose --buffer  # Permission difference
  python testing/rorpitertest.py --verbose --buffer
  python testing/rdifftest.py --verbose --buffer
  python testing/securitytest.py --verbose --buffer
  python testing/killtest.py --verbose --buffer
  python testing/backuptest.py --verbose --buffer
  python testing/comparetest.py --verbose --buffer
  python testing/regresstest.py --verbose --buffer
  python testing/restoretest.py --verbose --buffer
  python testing/cmdlinetest.py --verbose --buffer
  python testing/rdiffbackupdeletetest.py --verbose --buffer
  python testing/errorsrecovertest.py --verbose --buffer
  python testing/rdb_arguments.py --verbose --buffer
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 tools/completions/bash/rdiff-backup "$pkgdir/usr/share/bash-completion/completions/rdiff-backup"
}
