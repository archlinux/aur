# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=ant-gtk-theme
pkgver=1.3.0
pkgrel=1
pkgdesc="Ant Theme for GTK 3.x"
arch=('any')
license=('GPL')
url=https://www.gnome-look.org/p/1099856
options=('!strip')
depends=('gtk3')

_hash_time=($(curl -s "$url"| grep -e "hash =" -e "timetamp ="| sed "s/.*= '\(.*\)';/\1/"))
source=("Ant.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578335110/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant.tar"
	"Ant-Bloody.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578335460/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody.tar"
	"Ant-Nebula.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578334999/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula.tar"
	"Ant-Dracula.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578335151/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula.tar"
	"Ant-Dracula-slim.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578334984/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Dracula-Slim.tar"
	"Ant-Nebula-slim.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578335047/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Nebula-Slim.tar"
	"Ant-Bloody-slim.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578334951/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Bloody-Slim.tar"
	"Ant-slim.tar::https://dl.opendesktop.org/api/files/downloadfile/id/1578335024/s/${_hash_time[0]}/t/${_hash_time[1]}/u/Ant-Slim.tar")

noextract=('Ant.tar'
           'Ant-Bloody.tar'
           'Ant-Nebula.tar'
           'Ant-Dracula.tar'
           'Ant-Dracula-slim.tar'
           'Ant-Nebula-slim.tar'
           'Ant-Bloody-slim.tar'
           'Ant-slim.tar'
)

sha512sums=('8c722ccaa3810fc8ac2b76ba02fa1c413b2335bb679e3e255438e324a152dbef894840d495fa1d8b82eb18a86f844aeb80dd112140388c1ec719472bac440a10'
            'ac00d4b8611d8e07f60ac2c41d4f859f9f21b59b17be552756383fe7b719cdc80095fb082adcca7676c7aaf3f8eee917cb7734d29320ce518fc9e2a6a1e629cf'
            'fdda01632aa8ef93838c7fb192e0e54a154788906e9c03fb14d6223330ebca20ead0f0a123f8638b1a14357b701bc92d939ed24f388bf4fa30daf40d7bb2bc55'
            'eabd63acd9f7fd29d02b15fe498687f880a99367ede6518566aaee67dba41b5f109420440724a9773b2cb90fdadd0674cd0736c18e65f26718cdc1f9e9537d6d'
            '52db9d6ad372892db71dea359b23873c8a6990d834969401fbe6771db706fd9b76476bf44aa49f3622f431ac9d4636ac416c77702926b397bac7f0929af664bd'
            'd5a44c87978e6ee49bfd8efc733bb9f0e9d814186443d1669cee5e0c7c3ecbb5e1f6bed657ebdfdd2868bf9b22724fb6bebd4470db9a668848f9d7e96dd06a01'
            'e609a57b0026d0c19f18b706dd4803a0ded6380e10ab0e33c26b4fa0b4f131b582e59f2f861334c7b9854a6f9220de790608a1d1430ac71a2eeb155167edfc1b'
            '52bf12203615b9a703ff2cd61f89f2d5349c7684d896c22b03e2b53928f6cda0abf4f118f88dfd0c9a60149031970598b2d41be0c203da446045fe83618554e3')

prepare() {
  cd "${srcdir}"
  for THEME_FILE in "${noextract[@]}"
  do
    THEME_NAME="${THEME_FILE%.*}"
    mkdir -p "${THEME_NAME}"
    if echo "${THEME_FILE}" | grep "slim" > /dev/null
    then
      bsdtar xf "${THEME_FILE}" -C "${THEME_NAME}"
      cd "${THEME_NAME}"
      for SUB_THEME_FILE in $(find . -type f -name '*.tar')
      do
        SUB_THEME_NAME=$(basename "${SUB_THEME_FILE}")
        SUB_THEME_NAME="${SUB_THEME_NAME%.*}"
        mkdir -p "${SUB_THEME_NAME}"
        bsdtar xf "${SUB_THEME_FILE}" --strip-components=1 -C "${SUB_THEME_NAME}"
      done
      cd ..
    else
      bsdtar xf "${THEME_FILE}" --strip-components=1 -C "${THEME_NAME}"
    fi
  done
}

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  for THEME_INDEX_FILE in $(find "${srcdir}" -type f -name 'index.theme')
  do
    THEME_SRC_DIR=$(dirname "${THEME_INDEX_FILE}")
    THEME_NAME=$(basename "${THEME_SRC_DIR}")
    cp -r "${THEME_SRC_DIR}" "${pkgdir}/usr/share/themes"
  done
}
