# Maintainer: dumblob <dumblob@gmail.com>
# Contributor: dumblob <dumblob@gmail.com>

pkgver=7.1.0
pkgrel=1

_basename=bonita-bpm-community
_basenamever="${_basename}-$pkgver"
_prefix=bonitasoft

pkgname="${_basename}-bin"
pkgdesc='Bonita BPM Studio with embedded Engine + Portal'
url='http://www.bonitasoft.com/how-we-do-it#how-we-do-it_bonita-bpm'
license=('GPL2')
arch=('i686' 'x86_64')
# http://www.bonitasoft.com/products/download/bonita-bpm-linux-6-4-2-64bit?skip=true
source_x86_64=("http://download.forge.objectweb.org/bonita/BonitaBPMCommunity-${pkgver}-x86_64.run")
# http://www.bonitasoft.com/products/download/bonita-bpm-linux-6-4-2-32bit?skip=true
source_i686=(  "http://download.forge.objectweb.org/bonita/BonitaBPMCommunity-${pkgver}-x86.run")
sha256sums_x86_64=('8a0323bf9120b9475cff8cf48fe728666eac12e151a1405b5206b9f8652a55d4')  # 7.1.0
sha256sums_i686=('04fe7814c2a42753bf10984667e03cd6b6e7b81d0ac327bfe31755f3e826b7fb')  # 7.1.0
install=bonita-bpm-community.install

depends=('ffmpeg-compat' 'java-environment' 'libxslt' 'python' 'gtk2')
makedepends=()
# FIXME may be needed: 'postgresql' 'tomcat'
# FIXME may be needed: libavformat.so.52 libgstreamer-lite.so libavcodec.so.52
optdepends=(
  'jre7-openjdk-headless: PROVIDES libverify.so libjli.so libfontmanager.so libjava.so libawt.so libnio.so libjvm.so libnet.so libmawt.so'
  'openjdk6:              PROVIDES libverify.so libjli.so libfontmanager.so libjava.so libawt.so libnio.so libjvm.so libnet.so libmawt.so'
  'cuda-toolkit:          PROVIDES libverify.so libjli.so libfontmanager.so libjava.so libawt.so libnio.so libjvm.so libnet.so libmawt.so libJdbcOdbc.so'
  'libnet:                PROVIDES libnet.so'
  'jre7-openjdk:          PROVIDES libmawt.so'
)

provides=('bonita-bpm-community')
conflicts=()

build() {
  chmod +x *.run
  ./*.run --mode unattended --prefix "$_prefix/$_basenamever"

  # fix permissions
  find "$_prefix/$_basenamever/jre/" -name '*.so' -execdir chmod a+x '{}' \;
  chmod a+x \
    "$_prefix/$_basenamever/jre/lib/jexec" \
    "$_prefix/$_basenamever/jre/bin/"*

  # fix "...does not have the world readable bit set"
  rm "$_prefix/$_basenamever/uninstall"*

  # "disable" immediate auto-close of the whole program after launch
  printf '%s\n' '-Dorg.eclipse.swt.browser.DefaultType=mozilla' >> \
    "$_prefix/$_basenamever/"*.ini
}

package() {
  cd "$pkgdir"

  mkdir opt/
  mv "$srcdir/$_prefix/" opt/

  xdg_name="$(cd "opt/$_prefix/$_basenamever/" &&
    ls -1 *.desktop | sed -r 's|\.desktop$||')"
  mkdir -p usr/share/applications/
  ln -s "/opt/$_prefix/$_basenamever/${xdg_name}.desktop" \
    "$pkgdir/usr/share/applications/"

  mkdir -p usr/bin/
  cat > "usr/bin/$xdg_name" <<EOF
#!/bin/sh

set -e

# according to the XDG specification standard
XDG_CONFIG_HOME="\${XDG_CONFIG_HOME-\${HOME}/.config}"
XDG_DATA_HOME="\${XDG_DATA_HOME-\${HOME}/.local/share}"

#       # see https://github.com/guari/eclipse-ui-theme/issues/73
#       [ "0\$SWT_GTK3" -eq 0 -a -n "\$GTK_THEME" ] ||
#         printf 'INFO To avoid dark themes issues, switch to the default GTK3 light theme using\n\n\t%s\n\n' \
#         'export SWT_GTK3=0 GTK_THEME=some_nonsense'
#       # FIXME or use this one
#         #GTK2_RC_FILES='/usr/share/themes/Default/gtk-2.0-key/gtkrc'

cd '/opt/$_prefix/$_basenamever/'
exec '$(grep -E '^[[:blank:]]*Exec=' "opt/$_prefix/$_basenamever/"*.desktop |
    sed -r 's|^[^=]+=|/opt/|')' \
    -configuration "\$XDG_CONFIG_HOME/$_prefix/$_basenamever/configuration" \
    -data "\$XDG_DATA_HOME/$_prefix/$_basenamever/workspace" \
    "\$@"
EOF
  chmod a+x "usr/bin/$xdg_name"

  # overwrite the executable and icon paths (we can't do this before the
  #   here-doc construct as the original values are needed)
  sed -i -r \
    -e "s%^([[:blank:]]*Exec=).*%\1/usr/bin/$xdg_name%" \
    -e "s%^([[:blank:]]*Icon=)%\1/opt/%" \
    "opt/$_prefix/$_basenamever/"*.desktop
}
