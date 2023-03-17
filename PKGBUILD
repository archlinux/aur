# Maintainer: JustKidding <jk@vin.ovh>

pkgname=mongodb50
_pkgname=mongodb
# #.<odd number>.# releases are unstable development/testing
pkgver=5.0.15
pkgrel=1
pkgdesc="A high-performance, open source, schema-free document-oriented database"
arch=("x86_64")
url="https://www.mongodb.com/"
license=("Apache" "custom:SSPL1")
depends=('libstemmer' 'snappy' 'boost-libs' 'pcre' 'yaml-cpp' 'curl')
makedepends=('python-psutil' 'python-setuptools' 'python-regex' 'python-cheetah3' 'python-yaml' 'python-requests' 'boost')
optdepends=('mongodb-tools: mongoimport, mongodump, mongotop, etc'
            'mongosh-bin: interactive shell to connect with MongoDB')
backup=("etc/mongodb.conf")
conflicts=(mongodb)
provides=(mongodb="$pkgver")
source=(https://fastdl.mongodb.org/src/mongodb-src-r$pkgver.tar.gz
        mongodb.sysusers
        mongodb.tmpfiles
        mongodb-4.4.1-boost.patch
        mongodb-4.4.1-gcc11.patch
        mongodb-5.0.2-fix-scons.patch
        mongodb-5.0.2-no-compass.patch
        mongodb-5.0.2-skip-no-exceptions.patch
        mongodb-5.0.2-skip-reqs-check.patch
        mongodb-5.0.2-boost-1.79.patch
        mongodb-5.0.5-no-force-lld.patch
        mongodb-4.4.10-boost-1.81.patch)
sha256sums=('6f681ac44d494d4bc48de159080ccd53ae2fac337c6bde807f5f78ebd171f852'
            '3757d548cfb0e697f59b9104f39a344bb3d15f802608085f838cb2495c065795'
            'b7d18726225cd447e353007f896ff7e4cbedb2f641077bce70ab9d292e8f8d39'
            'd3bc20d0cb4b8662b5326b8a3f2215281df5aed57550fa13de465e05e2044c25'
            'f7e6d87b68f7703cdbd45e255962ed5a4f6d583aa76d6fcf4fdc7005211fbf06'
            '99e9080fa42b948a74221ea7601a0c2b54850c388eda6cafa9c245211ce56d0f'
            '41b75d19ed7c4671225f08589e317295b7abee934b876859c8777916272f3052'
            '5b81ebc3ed68b307df76277aca3226feee33a00d8bb396206bdc7a8a1f58f3e4'
            '4ff40320e04bf8c3e05cbc662f8ea549a6b8494d1fda64b1de190c88587bfafd'
            'a04aec4f8bd99ad213e31eb45a9e1658695442082e7c4f8c4044f6326eaa1acd'
            'f79f65824f81753d41d2274a6904930db11b06fe08f1442a24c30060cab27e32'
            '7bfeadf2fb7e13bd93c4515faada070410ddd8e276cc947b5b2b2292539051b7')

_scons_args=(
  CC="${CC:-gcc}"
  CXX="${CXX:-g++}"
  AR="${AR:-ar}"

  --use-system-pcre
  --use-system-snappy
  --use-system-yaml
  --use-system-zlib
  --use-system-stemmer
  --use-sasl-client
  --ssl
  --disable-warnings-as-errors
  --use-system-boost
  --use-system-zstd
  --runtime-hardening=off
)

all-flag-vars() {
  echo {C,CXX}FLAGS
}

_filter-var() {
  local f x var=$1 new=()
  shift

  for f in ${!var} ; do
    for x in "$@" ; do
      # Note this should work with globs like -O*
      [[ ${f} == ${x} ]] && continue 2
    done
    new+=( "${f}" )
  done
  export ${var}="${new[*]}"
}

filter-flags() {
  local v
  for v in $(all-flag-vars) ; do
    _filter-var ${v} "$@"
  done
  return 0
}

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

  if check_option debug n; then
    filter-flags '-m*'
    filter-flags '-O?'
  fi

  export SCONSFLAGS="$MAKEFLAGS"
  ./buildscripts/scons.py "${_scons_args[@]}" install-devcore
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

