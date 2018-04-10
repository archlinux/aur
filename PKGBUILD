# Maintainer: dumblob <dumblob@gmail.com>

pkgver=7.6.0
pkgrel=1

_basename=bonita-studio-community
_basenamever="${_basename}-$pkgver"
_prefix=bonitasoft

pkgname="${_basename}-bin"
pkgdesc='Bonita Studio with embedded Engine + Portal'
url='https://www.bonitasoft.com/bonita-platform'
license=('GPL2')
arch=('i686' 'x86_64')
# http://www.bonitasoft.com/products/download/bonita-bpm-linux-6-4-2-64bit?skip=true
source_x86_64=("http://download.forge.objectweb.org/bonita/BonitaStudioCommunity-${pkgver}-x86_64.run")
# http://www.bonitasoft.com/products/download/bonita-bpm-linux-6-4-2-32bit?skip=true
source_i686=(  "http://download.forge.objectweb.org/bonita/BonitaStudioCommunity-${pkgver}-x86.run")
sha256sums_x86_64=("814a8bb9b8b31035be516b510768235ce0781c4d21161c0a8a01939a6ee43cef")  # BonitaStudioCommunity-7.6.0-x86_64.run
sha256sums_i686=(  "9d1e60fd3df378e77c639bfc65b47503c5a05c046b4b533f75d86fb9972088ee")  # BonitaStudioCommunity-7.6.0-x86.run
install="${_basename}.install"
replaces=('bonita-bpm-community-bin')  # yeah, they renamed it

depends=('ffmpeg2.8' 'libglvnd' 'java-environment' 'libxslt' 'python' 'gtk2')
makedepends=()
# FIXME might be needed: 'postgresql' 'tomcat'
optdepends=(
  'jre7-openjdk-headless: PROVIDES libverify.so libjli.so libfontmanager.so libjava.so libawt.so libnio.so libjvm.so libnet.so libmawt.so'
  'cuda-toolkit:          PROVIDES libverify.so libjli.so libfontmanager.so libjava.so libawt.so libnio.so libjvm.so libnet.so libmawt.so libJdbcOdbc.so'
  'libnet:                PROVIDES libnet.so'
  'jre7-openjdk:          PROVIDES libmawt.so'
)

provides=("${_basename}")
conflicts=()

build() {
#  # use: makepkgg -cf --skipchecksums
#  {
#    #wget "$source_x86_64"
#    wget -c "$source_i686"
#    printf 'sha256sums_x86_64=("%s")  # %s\n' \
#      "$(sha256sum "$(basename "$source_x86_64")" | cut -b -64)" "$pkgver"
#    printf 'sha256sums_i686=(  "%s")  # %s\n' \
#      "$(sha256sum "$(basename "$source_i686"  )" | cut -b -64)" "$pkgver"
#    false
#  }

  [ "$(ls -1 *.run | wc -l)" -eq 1 ] || {
    printf 'ERR Multiple *.run files found.\n' >&2
    false
  }
  chmod +x *.run
  # FIXME a hack to kill the process, because it waits for user input indefinitely
  #  https://github.com/bonitasoft/bonita-studio/issues/397
  [ -e '/tmp/bitrock_installer.log' ] && first_run=yes
  ./*.run --mode unattended --prefix "$_prefix/$_basenamever" &
  pid=$!
  while sleep 1; do
    grep 'Installation completed' \
        "/tmp/bitrock_installer${first_run:+_$pid}.log" >/dev/null && {
      kill "$pid"
      break
    }

    [ $((x)) -gt $((60*3)) ] && {
      printf 'ERR Waited too long for the installation to finish.\n' >&2
      false
      break
    }
    x=$((x +1))
  done

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
