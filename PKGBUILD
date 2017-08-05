# Maintainer: David Matson <gitcoder at outlook dot com>
pkgname=freeswitch-core
pkgver=1.6.19
pkgrel=1
pkgdesc='A scalable, open source telephony platform'
arch=('i686' 'x86_64')
url='https://freeswitch.org/'
license=('MPL')
depends=('libedit' 'speex' 'openssl-1.0')
makedepends=('libjpeg-turbo' 'yasm')
optdepends=()
provides=('freeswitch')
conflicts=('freeswitch')
source=("https://files.freeswitch.org/releases/freeswitch/freeswitch-$pkgver.tar.xz"
        'freeswitch.service'
        'modules.conf')
sha256sums=('e8d271a0d876ba4cca551682af0a4f5047bfd79438fcebdcc17d00711c04a8ff'
            '7eff153fdae3c99cd884c654335b32f484df5cb7e624bd6adc630372ea83e573'
            'SKIP')

declare -A _mod_depends
_mod_depends=(['ldns']='mod_enum'
              ['postgresql-libs']='mod_cdr_pg_csv'
              ['unixodbc']='mod_odbc_cdr')

declare -A _mod_makedepends
_mod_makedepends=(['alsa-lib']='mod_alsa'
                  ['hiredis']='mod_hiredis'
                  ['imagemagick']='mod_imagick'
                  ['ladspa']='mod_ladspa'
                  ['lame']='mod_shout'
                  ['libmemcached']='mod_memcache'
                  ['libmongoc']='mod_mongo'
                  ['libmp4v2']='mod_mp4 mod_mp4v2'
                  ['libshout']='mod_shout'
                  ['libsndfile']='mod_sndfile'
                  ['libyaml']='mod_yaml'
                  ['lua']='mod_lua'
                  ['mono']='mod_managed'
                  ['mpg123']='mod_shout'
                  ['opal-stable']='mod_opal'
                  ['opus']='mod_opus'
                  ['portaudio']='mod_portaudio mod_portaudio_stream'
                  ['ptlib-stable']='mod_opal'
                  ['python2']='mod_python mod_v8'
                  ['soundtouch']='mod_soundtouch'
                  ['unixodbc']='mod_odbc_cdr'
                  ['vlc']='mod_vlc')

declare -A _mod_optdepends
_mod_optdepends=(['hiredis']='mod_hiredis'
                 ['imagemagick']='mod_imagick'
                 ['ldns']='mod_enum'
                 ['libjpeg-turbo']='mod_spandsp'
                 ['libmemcached']='mod_memcache'
                 ['libmongoc']='mod_mongo'
                 ['libmp4v2']='mod_mp4 mod_mp4v2'
                 ['libsndfile']='mod_sndfile'
                 ['lua']='mod_lua'
                 ['mono']='mod_managed'
                 ['mpg123']='mod_shout'
                 ['opus']='mod_opus'
                 ['perl']='mod_perl'
                 ['portaudio']='mod_portaudio mod_portaudio_stream'
                 ['soundtouch']='mod_soundtouch'
                 ['vlc']='mod_vlc')

mod_enabled() {
  if [[ "${srcdir}" ]]; then
    _path="${srcdir}"/modules.conf
  else
    _path=modules.conf
  fi

  grep -Eq "^[a-z_]+/$1$" ${_path}
}

for _dep in "${!_mod_depends[@]}"; do
  _mods=(${_mod_depends[$_dep]})

  for _mod in "${_mods[@]}"; do
    if [[ ! " ${depends} " =~ " ${_mod} " ]] && mod_enabled "${_mod}"; then
      depends+=("${_dep}")
    fi
  done
done

for _dep in "${!_mod_makedepends[@]}"; do
  _mods=(${_mod_makedepends[$_dep]})

  for _mod in "${_mods[@]}"; do
    if [[ ! " ${makedepends} " =~ " ${_mod} " ]] && mod_enabled "${_mod}"; then
      makedepends+=("${_dep}")
    fi
  done
done

for _dep in "${!_mod_optdepends[@]}"; do
  _mods=(${_mod_optdepends[$_dep]})
  _dep_mods=()

  for _mod in "${_mods[@]}"; do
    if mod_enabled "${_mod}"; then
      _dep_mods+=("${_mod}")
    fi
  done

  if [[ ${#_dep_mods[@]} -eq 1 ]]; then
    optdepends+=("${_dep}: for ${_dep_mods[0]} module")
  elif [[ ${#_dep_mods[@]} -gt 0 ]]; then
    _dep_list="${_dep_mods[@]}"
    optdepends+=("${_dep}: for ${_dep_list// / and } modules")
  fi
done

build() {
  cd "freeswitch-$pkgver"

  _mod_options=()

  if mod_enabled 'mod_cdr_pg_csv'; then
    _mod_options+=('--enable-core-pgsql-support')
  fi

  if mod_enabled 'mod_odbc_cdr'; then
    _mod_options+=('--enable-core-odbc-support')
  fi

  if mod_enabled 'mod_python'; then
    _mod_options+=('--with-python=/usr/bin/python2')
  fi

  # Work around FreeSWITCH bug FS-10257
  export CFLAGS="${CFLAGS} -Wno-parentheses -Wno-deprecated-declarations"

  # Use OpenSSL 1.0 until upstream supports 1.1.
  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig
  export CFLAGS="${CFLAGS} -I /usr/include/openssl-1.0"

  cp "${srcdir}"/modules.conf .

  ./configure \
    --enable-optimization \
    --disable-debug \
    --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --with-rundir=/run \
    --with-logfiledir=/var/log/freeswitch \
    --with-cachedir=/var/cache/freeswitch \
    --with-imagesdir=/usr/share/freeswitch/images \
    ${_mod_options[@]}

  make
}

package() {
  cd "freeswitch-$pkgver"

  make DESTDIR="$pkgdir/" install

  rmdir "${pkgdir}"/run
  rm -r "${pkgdir}"/etc/freeswitch/*

  if mod_enabled 'mod_perl'; then
    mkdir -p "${pkgdir}"/usr/lib/perl5
    mv "${pkgdir}"/usr/perl "${pkgdir}"/usr/lib/perl5/vendor_perl
  fi

  if ! mod_enabled 'mod_xml_rpc'; then
    rm -r "${pkgdir}"/usr/share/freeswitch/htdocs/*
    rm -r "${pkgdir}"/usr/share/freeswitch/fonts/*
    rm -r "${pkgdir}"/usr/share/freeswitch/images/*
  fi

  if ! mod_enabled 'mod_xml_cdr'; then
    rmdir "${pkgdir}"/var/log/freeswitch/xml_cdr
  fi

  if [ -e "${pkgdir}"/usr/share/freeswitch/grammar/model/communicator/ ]; then
    chown root:root \
      "${pkgdir}"/usr/share/freeswitch/grammar/model/communicator/*
  fi

  install -Dm644 "${srcdir}"/freeswitch.service \
    "${pkgdir}"/usr/lib/systemd/system/freeswitch.service
}
