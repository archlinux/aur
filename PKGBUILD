# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

# Please comment unwanted cmdpack tools in "_utils" section.

pkgbase='cmdpack'
groups="$pkgbase"
_utils=(
# Like below, add # at the beginning of unwanted tools' line.
# 'unwantedtool'
  'bin2ecm'
  'bin2iso'
  'bincomp'
  'brrrip'
  'byteshuf'
  'byteswap'
  'cdpatch'
  'fakecrc'
  'hax65816'
  'id3point'
  'pecompat'
  'rels'
  'screamf'
  'subfile'
  'uips'
  'usfv'
  'vb2rip'
  'wordadd'
  'zerofill'
)
for _tool in ${_utils[@]}; do pkgname+=("$pkgbase-$_tool"); done
pkgver=1.05
pkgrel=1
pkgdesc="Collection of command line utilities, most for emulation or disk images. (${_utils[*]})"
arch=('i686' 'x86_64')
url="https://github.com/chungy/cmdpack"
license=('GPL3')
makedepends=('asciidoc')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('f5e132ca4f1d7a560375c7a8dfacdaa00d71dc5cf65ee1f2b9a94033c953c96a')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  make ${_utils[@]} $(for _tool in ${_utils[@]}; do echo $_tool.1; done)
}

for _tool in "${_utils[@]}"; do
  src_mkdir_eval='mkdir -p ./src/ > /dev/null 2>&1'
  src_ext_ctr_eval='if ! [[ -d "./src/$pkgbase-$pkgver/" ]]; then bsdtar -xf "'$source'" -C ./src/; fi > /dev/null 2>&1'
  pkg_des_c_eval="sed -n 's/\"$//g;s/^#define TITLE \"$_tool - //p' ./src/\$pkgbase-\$pkgver/$_tool.c"
  add_pkg_func="package_$pkgbase-$_tool() {
                cd \${srcdir%/*}/
                provides=('$_tool')
                pkgdesc="\`$src_mkdir_eval\`\`$src_ext_ctr_eval\`\`$pkg_des_c_eval\`"
                cd  \${srcdir}/\${pkgbase}-\${pkgver}/
        "
  if [[ "$_tool" == "bin2ecm" ]]; then
      eval "$add_pkg_func
                conflicts=('ecm-tools')
                provides=('ecm-tools' '$_tool')
                replaces=('ecm-tools')
                make DESTDIR=\"\$pkgdir\" prefix=/usr install-$_tool
                }"
  elif [[ "$_tool" == "bin2iso" ]]; then
      eval "$add_pkg_func
                conflicts=('bin2iso')
                make DESTDIR=\"\$pkgdir\" prefix=/usr install-$_tool
                }"
  elif [[ "$_tool" == "zerofill" ]]; then
      eval "$add_pkg_func
                conflicts=('ucommon')
                make DESTDIR=\"\$pkgdir\" prefix=/usr install-$_tool
                }"
  else
    eval "$add_pkg_func
                make DESTDIR=\"\$pkgdir\" prefix=/usr install-$_tool
                }"
  fi
done
