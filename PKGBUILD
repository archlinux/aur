# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Erwin Van de Velde <erwin.vandevelde@gmail.com>

pkgname=rdiff-backup
pkgver=2.2.6
pkgrel=2
pkgdesc="Reverse differential backup tool, over a network or locally"
arch=(x86_64)
url="https://github.com/rdiff-backup/rdiff-backup"
license=(GPL-2.0-only)
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
)
sha256sums=(
  '5c7aeda0e37e1c0720a18831cb612d57802319118759af2896ae0f7308c8d629'
  '96395a278b0b2b23a2005449ab50a771cdd168683e5942bfcfa3d04f5980c9f2'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  fakeroot tar --extract \
    --file "$srcdir/rdiff-backup-filesrepo-$_rdiff_backup_filesrepo_hash/rdiff-backup_testfiles.tar" \
    --directory "$srcdir"
}

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  export PATH="$PWD/tmp_install/usr/bin:$PATH"

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
