# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

pkgname='dmesg-shutdown'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='record dmesg on every shutdown'
arch=('any')
url='https://unix.stackexchange.com/questions/284598/systemd-how-to-execute-script-at-shutdown-only-not-at-reboot'
license=('GPL')
depends=('systemd')
options=('!strip')
install="${pkgname}-install.sh"

package() {
  install -Dm644 <(cat << EOF
[Unit]
Description=Record dmesg on every shutdown
Conflicts=reboot.target
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/true
ExecStop=/usr/bin/bash /usr/lib/${pkgname}.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
  ) "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  install -Dm644 <(cat << EOF
#!/usr/bin/bash

/usr/bin/dmesg > /root/dmesg.\$(date +"%F_%H-%M-%S").txt
sync
EOF
  ) "${pkgdir}/usr/lib/${pkgname}.sh"
}
