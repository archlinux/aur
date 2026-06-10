# Maintainer: William Varmus <0@willvar.tw>
# Contributor: Boris Momčilović <boris.momcilovic@gmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>

pkgname=proxysql
pkgver=3.0.9
pkgrel=1
pkgdesc='High-performance MySQL proxy with query routing, caching, and load balancing (built from source)'
arch=('x86_64')
url="https://proxysql.com/"
license=('GPL-3.0-only')
options=('!lto')
depends=('gnutls' 'openssl')
makedepends=('cmake')
optdepends=('perl: for Galera cluster tools')
backup=('etc/proxysql.cnf')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sysown/proxysql/archive/refs/tags/v${pkgver}.tar.gz"
        "fix-mariadb-cmake-version.patch"
        "fix-mariadb-zlib-cmake-version.patch"
        "fix-clickhouse-cpp-cmake-version.patch"
        "fix-postgresql-bool-c23.patch")
sha256sums=('1660ab9869cee85fdf5fd35eeb6259eaff9b54ec67eb82cf7f605927afe0c650'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Create compiler wrappers to inject -ffile-prefix-map for reproducible builds
  mkdir -p "${srcdir}/wrapper-bin"
  cat > "${srcdir}/wrapper-bin/gcc" <<EOF
#!/bin/bash
exec /usr/bin/gcc -ffile-prefix-map=${srcdir}=/usr/src "\$@"
EOF
  cat > "${srcdir}/wrapper-bin/g++" <<EOF
#!/bin/bash
exec /usr/bin/g++ -ffile-prefix-map=${srcdir}=/usr/src "\$@"
EOF
  chmod +x "${srcdir}/wrapper-bin/gcc" "${srcdir}/wrapper-bin/g++"

  # Modify re2 compilation to use global-dynamic TLS model for shared library compatibility
  sed -i 's/-fPIC -DMEMORY_SANITIZER/-fPIC -ftls-model=global-dynamic -DMEMORY_SANITIZER/g' deps/Makefile

  # Modify deps/Makefile to apply compatibility patches after extracting mariadb-connector-c
  sed -i '/cd mariadb-client-library && tar -zxf mariadb-connector-c-.*-src.tar.gz/a\\tcd mariadb-client-library/mariadb_client \&\& patch -p0 < ../../fix-mariadb-cmake-version.patch\n\tcd mariadb-client-library/mariadb_client \&\& patch -p0 < ../../fix-mariadb-zlib-cmake-version.patch' deps/Makefile

  # Modify deps/Makefile to apply CMake version patch after extracting clickhouse-cpp
  sed -i '/cd clickhouse-cpp && tar -zxf v.*\.tar\.gz/a\\tcd clickhouse-cpp/clickhouse-cpp \&\& patch -p0 < ../../fix-clickhouse-cpp-cmake-version.patch' deps/Makefile

  # Modify deps/Makefile to apply C23 bool patch after extracting postgresql
  sed -i '/cd postgresql && tar -zxf postgresql-.*\.tar\.gz/a\\tcd postgresql/postgresql \&\& patch -p0 < ../../fix-postgresql-bool-c23.patch' deps/Makefile

  # Copy patch files to deps directory so they're accessible during build
  cp "${srcdir}/fix-mariadb-cmake-version.patch" deps/
  cp "${srcdir}/fix-mariadb-zlib-cmake-version.patch" deps/
  cp "${srcdir}/fix-clickhouse-cpp-cmake-version.patch" deps/
  cp "${srcdir}/fix-postgresql-bool-c23.patch" deps/
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Use compiler wrappers to inject -ffile-prefix-map
  export PATH="${srcdir}/wrapper-bin:${PATH}"
  export CC="${srcdir}/wrapper-bin/gcc"
  export CXX="${srcdir}/wrapper-bin/g++"

  # Unset CFLAGS and CXXFLAGS to avoid TLS model conflicts with re2
  # re2 requires -ftls-model=global-dynamic for shared library linking
  unset CFLAGS
  unset CXXFLAGS

  # Set GIT_VERSION environment variable for build
  export GIT_VERSION="v${pkgver}"

  # Build ProxySQL
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 src/proxysql "${pkgdir}/usr/bin/proxysql"

  # Install systemd services
  install -Dm644 systemd/system/proxysql.service "${pkgdir}/usr/lib/systemd/system/proxysql.service"
  install -Dm644 systemd/system/proxysql-initial.service "${pkgdir}/usr/lib/systemd/system/proxysql-initial.service"

  # Install configuration
  install -Dm644 etc/proxysql.cnf "${pkgdir}/etc/proxysql.cnf"

  # Install logrotate config
  install -Dm644 etc/logrotate.d/proxysql "${pkgdir}/etc/logrotate.d/proxysql"

  # Install tools
  install -Dm755 tools/proxysql_galera_checker.sh "${pkgdir}/usr/share/proxysql/tools/proxysql_galera_checker.sh"
  install -Dm755 tools/proxysql_galera_writer.pl "${pkgdir}/usr/share/proxysql/tools/proxysql_galera_writer.pl"
}
