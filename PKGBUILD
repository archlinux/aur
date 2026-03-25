# Maintainer: guglovich <your@email.com>
# Created with assistance from Claude (Anthropic), Gemini (Google), and Qwen 3.5 (Alibaba)
# Arch Linux Port of IssabelPBX
pkgname=issabelpbx
pkgver=2.12.0
pkgrel=1
pkgdesc="IssabelPBX - Asterisk Configuration GUI (Arch Linux Port)"
arch=('any')
url="https://github.com/IssabelFoundation/issabelPBX"
license=('GPL')
depends=('issabel-framework' 'php-legacy' 'mariadb' 'asterisk' 'gettext' 'perl' 'wget' 'mpg123' 'sox')
optdepends=('php-pear-db: Database abstraction (Pear DB)')
install=issabelPBX.install
backup=(
  'etc/issabelpbx.conf'
  'etc/amportal.conf'
)
source=()

package() {
  # Copy modules to admin/modules
  install -d "${pkgdir}/var/www/html/admin/modules"
  
  # Copy all module directories
  for module in accountcodepreserve announcement asterisk-cli asteriskinfo asternicivr backup \
      blacklist bosssecretary bulkdids bulkextensions callback callforward callrecording \
      callwaiting cdr cidlookup conferences core customappsreg customcontexts customerdb \
      dahdiconfig dashboard daynight dialplaninjection dictate digium_phones directory disa \
      donotdisturb dundicheck dynamicfeatures dynroute extensionsettings fax featurecodeadmin \
      findmefollow framework fw_langpacks hotelwakeup iaxsettings infoservices inventorydb \
      ivr languages logfiles manager managersettings miscapps miscdests motif music \
      outroutemsg paging parking pbdirectory phonebook phpagiconf phpinfo pinsets \
      printextensions queuemetrics queueprio queues recordings restart ringgroups setcid \
      sipsettings speeddial superfecta tgzassets timeconditions trunkbalance tts userman \
      vmblast voicemail weakpasswords writequeuelog; do
    if [ -d "${startdir}/${module}" ]; then
      cp -r "${startdir}/${module}" "${pkgdir}/var/www/html/admin/modules/"
    fi
  done

  # Copy framework files
  if [ -d "${startdir}/framework" ]; then
    cp -r "${startdir}/framework/"* "${pkgdir}/var/www/html/admin/"
  fi

  # Copy configuration files
  install -d "${pkgdir}/etc"
  if [ -f "${startdir}/framework/amp_conf/htdocs/admin/issabelpbx.conf" ]; then
    install -m644 "${startdir}/framework/amp_conf/htdocs/admin/issabelpbx.conf" "${pkgdir}/etc/issabelpbx.conf"
  fi
  if [ -f "${startdir}/framework/amp_conf/etc/amportal.conf" ]; then
    install -m644 "${startdir}/framework/amp_conf/etc/amportal.conf" "${pkgdir}/etc/amportal.conf"
  fi

  # Logrotate
  install -d "${pkgdir}/etc/logrotate.d"
  install -m644 "${startdir}/build/5.0/files/issabelpbx.logrotate" "${pkgdir}/etc/logrotate.d/issabelpbx"

  # Create log directory
  install -d "${pkgdir}/var/log/asterisk"
}
