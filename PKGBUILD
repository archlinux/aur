# Context MkIV additional distribution files
# Maintainer: Philipp Gesang <phg@phi-gamma.net>
pkgname=context-mkiv
pkgver=20160905_1028
pkgrel=1
pkgdesc="The ConTeXt MkIV typesetting system; additional files"
arch=(any)
url=""
license=('GPL')
groups=()
depends=(luatex-svn context-git)
## mtxrun is part of Context; to execute it we need Luatex as the interpreter
makedepends=(rsync luatex-svn context-git)
conflicts=(context-minimals-git)
source=( \
  context-setup-env.sh \
  context-wrap-mtxrun.sh \
)
sha512sums=('f7b52dbede67e8c4a924e2700df93a843704045c3b00a17b593dbf7771ec7c857b48c7a6aa95c8bb4923a4c91e68adf63a6223f59c84c0fab3a6023ad0589aaa'
            'aa3f9fd05f438965576ad57f5ad1bb2d873b672586f29716e0a2087bde0edc3d3ccf1d0c67b503eb3140dd0ff87bc5be3b9e627867e229cbcddb68cf0ba01099')

# binaries and scripts installed with deps
readonly _luatex=/usr/bin/texlua
readonly _cntroot=/usr/share/context-git
readonly _mtxpath=./texmf-context/scripts/context/lua
readonly _mtxrun=${_mtxpath}/mtxrun.lua

_mtx-script () {
  local scr="mtx-$1.lua"
  shift
  MTX_PLATFORM=linux TEXOS=texmf-linux ${_luatex} ${_mtxrun} --script "${_mtxpath}/${scr}" $@
}

pkgver() {
  # no colon, hyphen, or whitespace permitted
  cd context
  _mtx-script context --version 2>/dev/null \
    |egrep "^mtx-context *| current version: .*$" \
    |sed -n 's/^.*: \(....\)\.\(..\)\.\(..\) \(..\):\(..\)$/\1\2\3_\4\5/p'
  exit 42
}

prepare() {
  [[ ! -d context ]] && mkdir context
  cd context
  if [[ -L ./texmf-context ]]; then
    msg "Repo symlink already present"
  else
    ln -s "${_cntroot}" ./texmf-context
  fi
  _mtx-script update \
    --force --update --context=beta --platform=linux \
    --engine=luatex --modules=all --texroot=.
}

build() {
  cd context
  ${_luatex} ${_mtxrun} --generate
}

package() {
  rm -rf "${pkgdir}"/*
  local texdst="${pkgdir}/usr/share/texmf"
  local libdst="${pkgdir}/usr/lib"
  local execdst="${pkgdir}/usr/bin"
  local platformdst="${texdst}/texmf-linux/bin"
  local subdirs=( texmf texmf-fonts texmf-modules )

  cd context
  install -dm755 "${texdst}"
  for dir in ${subdirs[@]}; do
    cp -a "${dir}" "${texdst}"
  done
  # install symlink to Context git
  ln -s /usr/share/context-git "${texdst}/texmf-context"

  # move mtxrun out of the way, we’ll call it with the wrapper
  install -dm755 "${platformdst}"
  install -Dm755 texmf-linux/bin/mtxrun "${platformdst}"
  install -dm755 "${execdst}"
  install -Dm755 "${srcdir}/context-wrap-mtxrun.sh" "${execdst}/mtxrun"

  # mktexlsr is the only script we take as-is
  install -Dm755 texmf-linux/bin/mktexlsr "${execdst}"
  install -dm755 "${libdst}"
  install -Dm644 "${srcdir}/context-setup-env.sh" "${libdst}"

  ln -s /usr/bin/luatex "${platformdst}"
  ln -s /usr/bin/luatex "${platformdst}/texlua"
  ln -s /usr/bin/luatex "${platformdst}/texluac"

  [ ! -d tmp ] && mkdir tmp
  >tmp/context-wrap-context.sh cat <<STOPTHAT
#!/usr/bin/env bash
source "/usr/lib/context-setup-env.sh"
mtxrun --script context "\$@"
STOPTHAT
  install -Dm755 tmp/context-wrap-context.sh "${execdst}/context"
}

# vim:et:ft=sh:sw=2:ts=8
