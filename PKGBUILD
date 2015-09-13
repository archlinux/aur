# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributer: N30N <archlinux@alunamation.com>
# Contributer: Ted Smith <tedsmith@tedsmithphotography.com>

set -u
pkgname='lightzone-free'
pkgver='2.4'
pkgrel='3'
pkgdesc='The last free version of LightZone, a professional photo browser and editor, like Aperture or Lightroom'
arch=('i686' 'x86_64')
# Not sure where to point the url.
#url='http://lightcrafts.com/linux/'
url='http://www.berthon.eu/2007/lightzone-24-for-linux-is-released/'
license=('custom')
depends_x86_64=('lib32-gcc-libs' 'lib32-libstdc++5' 'lib32-libx11' 'lib32-libxcb' 'lib32-libxtst')
depends_i686=('gcc-libs' 'libstdc++5' 'libx11' 'libxtst' 'java-runtime')
provides=('lightzone')
conflicts=('lightzone' 'lightzone3')
source=(
  'http://alunamation.com/archlinux/builds/lightzone/LightZone-rev.8224.tar.gz'
  'lightzone.desktop'
)
sha256sums=('7da5610afe0cf431863eacaccd07c2f96655d86ddc68f3258a7a7cbc0aa8971d'
            '00b16af755c4927ccc549ce98b23644fe94b59e1d20132d763756326e1c782e5')
#PKGEXT='.pkg.tar.gz'
options=('!strip')

prepare() {
  set -u
  cd 'LightZone/jre/lib'
  # The startup script would unpack the files but only as root. So we do it here.
  readarray -t _pack_files < <(find -type f -name '*.pack')
  local _pack_file
  for _pack_file in "${_pack_files[@]}"; do
    ../bin/unpack200 -r "${_pack_file}" "${_pack_file%.pack}"
  done
  set +u
}

package() {
  set -u
  cd 'LightZone'

  install -d "${pkgdir}/usr/bin/"
  ln -sf '/opt/lightzone/LightZone' "${pkgdir}/usr/bin/lightzone"
  install -Dpm644 "${srcdir}/lightzone.desktop" -t "${pkgdir}/usr/share/applications/"

  install -d "${pkgdir}/opt/lightzone/"
  mv * '.install4j' "${pkgdir}/opt/lightzone/"
  rm -f "${pkgdir}/opt/lightzone/.install4j/firstrun"

  # Either way works, tested with i686 and x86_64
  if ! :; then
    ln -sf 'client' "${pkgdir}/opt/lightzone/jre/lib/i386/server"
  else
    sed -i -e "s|^-client IF_SERVER_CLASS -server|-client KNOWN -server|" \
      "${pkgdir}/opt/lightzone/jre/lib/i386/jvm.cfg"
  fi

  # Both i686 and x86_64 work without this patch
  #sed -i -e "s|^# INSTALL4J_JAVA_HOME_OVERRIDE=|INSTALL4J_JAVA_HOME_OVERRIDE='/opt/java/jre'|" \
  #  "${pkgdir}/opt/lightzone/LightZone"
  #sed -i -e "s|^# INSTALL4J_JAVA_HOME_OVERRIDE=|INSTALL4J_JAVA_HOME_OVERRIDE='/opt/lightzone/jre'|" \
  #  "${pkgdir}/opt/lightzone/LightZone"
  set +u
}
set +u
