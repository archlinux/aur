# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="py-mailqueued-mta"
pkgver="0.2.0"
pkgrel="1"
pkgdesc="Uses py-mailqueued as an MTA for msmtp"
arch=("any")
license=("MIT")
depends=("msmtp" "py-mailqueued")
conflicts=("smtp-forwarder")
provides=("smtp-forwarder")

package() {
    cd "${pkgdir}" || return
    mkdir -p "usr/bin" && \
    cat <<-EOF >"usr/bin/sendmail" || return
		#!/bin/bash

		# \`DBUS_SESSION_BUS_ADDRESS\` is not set if the script is run from a cron job
		# so extract it from the running process environments
		if [[ -z "\${DBUS_SESSION_BUS_ADDRESS}" ]]; then
		    eval "\$(ps -u "\${USER}" e -e -o cmd | \\
		        awk '\$0 ~ /^[^[:space:]]*dbus-daemon.*[[:space:]]--session/ { for(i=2; i<=NF; i++) print \$i }' | \\
		        awk '{ sub(/=/," ") }1' | \\
		        awk '\$1 == "DBUS_SESSION_BUS_ADDRESS" { printf "export %s=\"%s\"", \$1, \$2 }')"
		fi

		/usr/bin/mail-queue /usr/bin/msmtp "\$@"
	EOF
    chmod +x "usr/bin/sendmail"
}
