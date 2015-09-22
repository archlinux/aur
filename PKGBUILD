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
for _tool in ${_utils[@]}; do pkgname+=("$pkgbase-$_tool"); done && pkgname+=("$pkgbase-docs")
pkgver=1.04
pkgrel=1
pkgdesc="Collection of command line utilities, most for emulation or disk images. (${_utils[*]})"
arch=('i686' 'x86_64')
url="https://github.com/chungy/cmdpack"
license=('GPL3')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('585dc53df1f854d53db3bdb38fc7d853e9b34c1c4a7b57fd8e0c8a5a4c908a9d')

build() {
  cd "$srcdir/$pkgbase-$pkgver"

  make
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
                provides=('ecm-tools')
                replaces=('ecm-tools')
                make DESTDIR=\"\$pkgdir\" prefix=/usr install-ecm2bin
                }"
  elif [[ "$_tool" == "bin2iso" ]]; then
      eval "$add_pkg_func
                conflicts=('bin2iso')
                provides=('$pkgbase-$_tool')
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

eval "package_$pkgbase-docs() {
  pkgdesc='$pkgbase documentation'
  cd \$srcdir/\${pkgbase}-\${pkgver}

  install -Dm0644 cmdpack.txt \${pkgdir}/usr/share/doc/\${pkgbase}/cmdpack.txt
}"
