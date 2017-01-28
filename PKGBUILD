# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Contributor: Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgbase=cmdpack
groups=($pkgbase)
_utils=('bin2ecm' 'bincomp' 'brrrip' 'byteshuf' 'cdpatch' 'fakecrc'
        'hax65816' 'pecompat' 'rels' 'screamf' 'uips' 'vb2rip'
        'wordadd')
for _tool in ${_utils[@]}; do pkgname+=("$pkgbase-$_tool"); done
pkgver=1.06
pkgrel=1
pkgdesc="Collection of command line utilities, most for emulation or disk images. (${_utils[*]})"
arch=('i686' 'x86_64')
url="https://github.com/chungy/cmdpack"
license=('GPL3')
makedepends=('asciidoc')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('6ce7029c0f2b0fbc6a1e26fb3ad8003ed18836aa3ef35f148ec51cde0b703307')

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
  else
    eval "$add_pkg_func
                make DESTDIR=\"\$pkgdir\" prefix=/usr install-$_tool
                }"
  fi
done
