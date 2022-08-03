# Maintainer: JustKidding <jk@vin.ovh>

pkgname=mongodb44
_pkgname=mongodb
# #.<odd number>.# releases are unstable development/testing
pkgver=4.4.15
pkgrel=1
pkgdesc="A high-performance, open source, schema-free document-oriented database (last version to support non-avx CPUs)"
arch=("x86_64" "aarch64")
url="https://www.mongodb.com/"
license=("Apache" "custom:SSPL1")
depends=('libstemmer' 'snappy' 'boost-libs' 'pcre' 'yaml-cpp' 'curl')
makedepends=('scons' 'python-psutil' 'python-setuptools' 'python-regex' 'python-cheetah3' 'python-yaml' 'python-requests' 'boost')
optdepends=('mongodb-tools: mongoimport, mongodump, mongotop, etc'
            'mongosh-bin: interactive shell to connect with MongoDB')
backup=("etc/mongodb.conf")
conflicts=(mongodb)
provides=(mongodb)
source=(https://fastdl.mongodb.org/src/mongodb-src-r$pkgver.tar.gz
        mongodb.sysusers
        mongodb.tmpfiles
        mongodb-4.4.1-fix-scons.patch
        mongodb-4.4.8-no-compass.patch
        mongodb-4.4.1-boost.patch
        mongodb-4.4.1-gcc11.patch
        mongodb-4.4.10-boost-1.79.patch
        mongodb-4.4.10-no-force-lld.patch)
sha256sums=('fb7ef14e2539df0addc1e350ad2a0fdb7dd078a60d49ab15d9932f193ea1da33'
            '3757d548cfb0e697f59b9104f39a344bb3d15f802608085f838cb2495c065795'
            'b7d18726225cd447e353007f896ff7e4cbedb2f641077bce70ab9d292e8f8d39'
            '631513598bf0e00b4f133d3f253ea76ae2958317fc2acc2d420726f1b76f09dd'
            '50c7d3968ee37bf25694f0fe8a92bb097c52c26361c78da620caa2ffa8cf4375'
            'd3bc20d0cb4b8662b5326b8a3f2215281df5aed57550fa13de465e05e2044c25'
            'f7e6d87b68f7703cdbd45e255962ed5a4f6d583aa76d6fcf4fdc7005211fbf06'
            '4202e039944fde80daa1bd3a5f332c522d8db96b4c3cf7c764355c5fc9089137'
            '76e61d1d4f5b4e7c8cd760b1fc0dc86978a8e180d184cdfc7f61fba7d5543a95')

_scons_args=(
  --use-system-pcre # wait for pcre 8.44+ https://jira.mongodb.org/browse/SERVER-40836 and https://jira.mongodb.org/browse/SERVER-42990
  --use-system-snappy
  --use-system-yaml # https://jira.mongodb.org/browse/SERVER-43980
  --use-system-zlib
  --use-system-stemmer
  --use-sasl-client
  --ssl
  --disable-warnings-as-errors
  --use-system-boost    # Doesn't compile
  --use-system-zstd
  --runtime-hardening=off
)

prepare() {
  cd "${srcdir}/${_pkgname}-src-r${pkgver}"

  # Keep historical Arch dbPath
  sed -i 's|dbPath: /var/lib/mongo|dbPath: /var/lib/mongodb|' rpm/mongod.conf

  # Keep historical Arch conf file name
  sed -i 's|-f /etc/mongod.conf|-f /etc/mongodb.conf|' rpm/mongod.service

  # Keep historical Arch user name (no need for separate daemon group name)
  sed -i 's/User=mongod/User=mongodb/' rpm/mongod.service
  sed -i 's/Group=mongod/Group=mongodb/' rpm/mongod.service
  sed -i 's/chown mongod:mongod/chown mongodb:mongodb/' rpm/mongod.service

  # Remove sysconfig file, used by upstream's init.d script not used on Arch
  sed -i '/EnvironmentFile=-\/etc\/sysconfig\/mongod/d' rpm/mongod.service

  # Make systemd wait as long as it takes for MongoDB to start
  # If MongoDB needs a long time to start, prevent systemd from restarting it every 90 seconds
  # See: https://jira.mongodb.org/browse/SERVER-38086
  sed -i 's/\[Service]/[Service]\nTimeoutStartSec=infinity/' rpm/mongod.service

  if [[ "$CARCH" == "aarch64" ]]; then
    _scons_args+=(--use-hardware-crc32=off)
  fi

  if check_option debug y; then
    _scons_args+=(--dbg=on)
  fi

  if check_option lto y; then
    _scons_args+=(--lto=on)
  fi

  # apply gentoo patches
  for file in $srcdir/*.patch; do
    echo "Applying patch $file..."
    patch -Np1 -i $file
  done
}

build() {
  cd "${srcdir}/${_pkgname}-src-r${pkgver}"

  export SCONSFLAGS="$MAKEFLAGS"
  scons install-devcore "${_scons_args[@]}"
}

package() {
  cd "${srcdir}/${_pkgname}-src-r${pkgver}"

  # Install binaries
  install -D build/install/bin/mongo "$pkgdir/usr/bin/mongo"
  install -D build/install/bin/mongod "$pkgdir/usr/bin/mongod"
  install -D build/install/bin/mongos "$pkgdir/usr/bin/mongos"

  # Keep historical Arch conf file name
  install -Dm644 "rpm/mongod.conf" "${pkgdir}/etc/${_pkgname}.conf"

  # Keep historical Arch service name
  install -Dm644 "rpm/mongod.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  # Install manpages
  install -Dm644 "debian/mongo.1" "${pkgdir}/usr/share/man/man1/mongo.1"
  install -Dm644 "debian/mongod.1" "${pkgdir}/usr/share/man/man1/mongod.1"
  install -Dm644 "debian/mongos.1" "${pkgdir}/usr/share/man/man1/mongos.1"

  # Install systemd files
  install -Dm644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"

  # Install license
  install -D LICENSE-Community.txt "$pkgdir/usr/share/licenses/mongodb/LICENSE"
}
# vim:set ts=2 sw=2 et:

