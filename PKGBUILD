# Maintainer: David Wang <cryptic.triangles AT gmail DOT com>

_gitauth='jca02266'
_pkgname='lha'
pkgname="${_pkgname}-git"
pkgver=1.14i_ac20220213.gc2fa389
pkgrel=1
pkgdesc="Compression and archive utility for LH-7 format archives (GIT version)"
arch=('x86_64')
url="https://github.com/${_gitauth}/${_pkgname}"
license=('LicenseRef-lha')
conflicts=('lhasa' 'lhasa-git')
provides=("${_pkgname}" 'lhasa')
source=(
  "$pkgname::git+${url}.git?signed"
  "https://packages.debian.org/changelogs/pool/non-free/l/lha/current/copyright"
)
sha256sums=('SKIP'
            '5afb178c19472a2528102fff8050d365c4d5b5dda2f8f7b158ba5d9f62a86a7d')
validpgpkeys=(
  968479A1AFF927E37D1A566BB5690EEEBB952194 # GitHub
)

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  makedepends+=('git')
  provides+=("${_pkgname}=${pkgver%%.g*}")
  conflicts+=("${_pkgname}")
fi

pkgver() {
  cd "$pkgname"
  local _cfgver="$(sed -n '/AC_INIT/p' configure.ac | sed 's/^.*1\./1./;s/-/_/;s/\,.*$//')"
  local _githash="$(git describe --long --abbrev=7 --tags | sed 's/^release.*.g/g/')"
  printf "%s.%s\n" "${_cfgver}" "${_githash}"
}

prepare() {
  cd "$pkgname"
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      patch -Np0 -i "../$src"
  done

  # Stage all license/redistribution information to be added into LICENSE
  {
    # Extract copyright by current author as located in lha (1) manpage
    head -23 "$srcdir/$pkgname"/man/lha.1 | tail -21 | sed 's/\.\\\"//;s/^\ //'
    echo ""
    # Include author's redistribution notes as found on upstream repo
    echo "The following section 4 in README.md as well as README.jp.md outlines"
    echo "the redistribution permission as per Koji Arai's statements in both"
    echo "English via automated translation and Japanese."
    # Convert markdown numbered lists into plaintext
    tail -20 "$srcdir/$pkgname"/README.md | sed 's/#\ /4.\ /'
    tail -24 "$srcdir/$pkgname"/README.jp.md
    echo ""
    # Include information as described on project repo's description and
    # UTF-8 converted copyright file
    echo "Below this line contains the original, UTF-8 converted original license that"
    echo "appears on current maintainer for LHa for Unix GitHub repository, as"
    echo "about/description; LHa for UNIX - Note: This software is licensed under the"
    echo "ORIGINAL LICENSE. It is written in man/lha.n in Japanese (Translated:"
    echo "https://packages.debian.org/changelogs/pool/non-free/l/lha/current/copyright)"
    echo ""
    # Include UTF-8 converted copyright file
    iconv -f EUC-JP -t UTF-8 "$srcdir/copyright"
  } > LICENSE 2>&1
}

build() {
  cd "$pkgname"
  autoreconf --verbose --force --install

  # https://gitlab.archlinux.org/pacman/namcap/-/issues/72#note_189964
  LDFLAGS+=' -Wl,-z,shstk'
  ./configure \
    --prefix=/usr

  make \
    CFLAGS+="-Wno-incompatible-pointer-types -Wno-unused-result" \
    CFLAGS+="-Wno-old-style-definition"
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  depends=('glibc')

  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.EUC-JP"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
