# Maintainer: Alexander Sobolevkiy <smak.nsk [at] gmail [dot] com>
# Based on https://github.com/aerospike/aerospike-client-php

pkgname=aerospike-client-php
pkgver=7.0.0
pkgrel=1
pkgdesc="The Aerospike PHP client as a C-extension for PHP7"
arch=('any')
url="https://github.com/aerospike/aerospike-client-php"
license=('Proprietary')
makedepends=('git' 'aerospike-client-c-libuv')
_gitroot="https://github.com/aerospike/aerospike-client-php.git"
_gitname="aerospike-client-php"
_extname=aerospike

build() {
  cd ${srcdir}/

  if [[ -d ${srcdir}/${_gitname} ]] ; then
    rm -rf "${srcdir}/${_gitname}"
  fi

  git clone --recursive --branch ${pkgver} ${_gitroot}

  cd ${srcdir}/${_gitname}/src/

  export DOWNLOAD_C_CLIENT=0;
  export PREFIX=/usr;
  export LUA_PATH=/opt/aerospike/client/sys/udf/lua;
  sh build.sh
}

package() {
  install -m0755 -d "$pkgdir/etc/php/conf.d/"
  install -m0755 -d "$pkgdir/usr/local/aerospike/lua"
  install -m0755 -d "$pkgdir/usr/local/aerospike/usr-lua"
  
  echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
  echo "aerospike.udf.lua_system_path=/usr/local/aerospike/lua" >> "$pkgdir/etc/php/conf.d/$_extname.ini"
  echo "aerospike.udf.lua_user_path=/usr/local/aerospike/usr-lua" >> "$pkgdir/etc/php/conf.d/$_extname.ini"
  chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
  
  install -m0755 -D "${_gitname}/src/modules/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
  
  install -Dm644 "${_gitname}/modules/aerospike-lua-core/src/aerospike.lua" "${pkgdir}/usr/local/aerospike/lua/"
  install -Dm644 "${_gitname}/modules/aerospike-lua-core/src/as.lua" "${pkgdir}/usr/local/aerospike/lua/"
  install -Dm644 "${_gitname}/modules/aerospike-lua-core/src/stream_ops.lua" "${pkgdir}/usr/local/aerospike/lua/"
}
