# Maintainer: David Matson <gitcoder at outlook dot com>
pkgbase=freeswitch-music
pkgver=1.0.52
pkgrel=2
pkgdesc='On-hold music for FreeSWITCH'
arch=('any')
url='https://freeswitch.org/'
license=('custom:none')
depends=('freeswitch-core')
options=('!strip')

pkgname=()
source=()

_sounds=('8000:8KHz'
         '16000:16KHz'
         '32000:32KHz'
         '48000:48KHz')

for _sound in "${_sounds[@]}"; do
  OIFS=$IFS
  IFS=:; read -r -a _parts <<< "${_sound}"
  IFS=$OIFS

  _rate=${_parts[0]}
  _desc=${_parts[1]}

  _pkgname="freeswitch-music-$_rate"
  _file="freeswitch-sounds-music-$_rate-$pkgver"

  pkgname+=($_pkgname)
  source+=("https://files.freeswitch.org/releases/sounds/$_file.tar.gz")
  eval "package_$_pkgname() {
    _package $_file \"$_desc\"
  }"
done

# Don't extract anything automatically (would use same directory).
noextract=("${source[@]##*/}")

# Force extraction of each source into a separate directory.
prepare() {
  for _s in ${source[@]##*/}; do
    _extract="${_s%%\.[^0-9]*}"
    mkdir -p $_extract
    tar -C $_extract -xf $_s
  done
}

_package() {
  pkgdesc="$2 on-hold music for FreeSWITCH"
  cd "$1"
  find . -type f -print0 | while IFS= read -r -d '' _f; do
   install -D -m644 "${srcdir}/$1/$_f" "${pkgdir}/usr/share/freeswitch/sounds/$_f"
  done
}

sha256sums=('2491dcb92a69c629b03ea070d2483908a52e2c530dd77791f49a45a4d70aaa07'
            '93e0bf31797f4847dc19a94605c039ad4f0763616b6d819f5bddbfb6dd09718a'
            '4129788a638b77c5f85ff35abfcd69793d8aeb9d7833a75c74ec77355b2657a9'
            'cc31cdb5b1bd653850bf6e054d963314bcf7c1706a9bf05f5a69bcbd00858d2a')
