# Maintainer: Ruiqi "Richard" Niu <rniu5@jh.edu>
# Contributor: Claude Opus 4.8 (Anthropic) <claude.ai>
# Contributors: titanbubu, sirwillis92, mjevans, and everyone who participates the discussion at https://github.com/DFJacob/AbioticFactorDedicatedServer/issues/3

pkgname=abiotic-factor-server
pkgver=1.0.0
pkgrel=1
pkgdesc="Abiotic Factor dedicated server (Windows build under Wine), managed by systemd"
arch=('x86_64')
url="https://github.com/DFJacob/AbioticFactorDedicatedServer"
license=('LicenseRef-Steam-Subscriber-Agreement')
depends=('steamcmd'
         'wine'
         'lib32-dbus' # otherwise steamcmd is not able to connect to network
         )
backup=('etc/abiotic-factor/server.conf')

# Steam AppID of the Abiotic Factor Dedicated Server tool.
_appid=2857200

# No upstream tarball: the game is fetched/updated by SteamCMD at runtime.
# Everything this package ships is generated below, so there are no sources.
source=()
sha256sums=()

package() {
    # --- System user (created on install via systemd-sysusers) ------------
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf" <<-EOF
		u abiotic - "Abiotic Factor server" /var/lib/abiotic-factor
	EOF

    # --- State directory (created on install via systemd-tmpfiles) --------
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf" <<-EOF
		d /var/lib/abiotic-factor 0750 abiotic abiotic -
	EOF

    # --- Default configuration (EnvironmentFile for the unit) -------------
    install -Dm644 /dev/stdin "${pkgdir}/etc/abiotic-factor/server.conf" <<-EOF
		## Abiotic Factor dedicated server configuration.
		## After editing run:  sudo systemctl restart abiotic-factor

		# Name shown in the in-game server browser
		SERVER_NAME="Abiotic Factor Server"

		# World save folder name (default: Cascade)
		WORLD_SAVE_NAME="Cascade"

		# Max players: 1-24. Values above 6 warn players before they join.
		MAX_PLAYERS=6

		# Network ports. Forward these on your router; UDP is required.
		PORT=7777
		QUERY_PORT=27015

		# Optional passwords. Leave empty to disable.
		SERVER_PASSWORD=""
		ADMIN_PASSWORD=""

		# Extra launch parameters, space separated. Examples:
		#   EXTRA_ARGS="-MultiHome=1.1.1.1"   # bind a specific public IP
		#   EXTRA_ARGS="-UseLocalIPs"              # help LAN joins (may break WAN)
		#   EXTRA_ARGS="-PlatformLimited=PC"       # Steam-only, no crossplay
		EXTRA_ARGS=""

		# Set to 0 to skip the SteamCMD update check on every start.
		UPDATE_ON_START=1
	EOF

    # --- Launch wrapper ---------------------------------------------------
    install -Dm755 /dev/stdin "${pkgdir}/usr/lib/abiotic-factor/run" <<-EOF
		#!/usr/bin/env bash
		# Installs/updates and launches the Abiotic Factor dedicated server headless.
		set -u

		APPID=${_appid}
		INSTALL_DIR="\${INSTALL_DIR:-/var/lib/abiotic-factor/server}"
		EXE="\$INSTALL_DIR/AbioticFactor/Binaries/Win64/AbioticFactorServer-Win64-Shipping.exe"

		# Wine: dedicated server is headless, so no display, no Gecko/Mono prompts.
		export WINEPREFIX="\${WINEPREFIX:-/var/lib/abiotic-factor/.wine}"
		export WINEDEBUG="\${WINEDEBUG:--all}"
		export WINEDLLOVERRIDES="\${WINEDLLOVERRIDES:-mscoree,mshtml=}"
		unset DISPLAY

		# 1. Install or update the Windows server build via SteamCMD.
		#    (SteamCMD can exit non-zero even on success, so don't abort on it.)
		if [[ "\${UPDATE_ON_START:-1}" == 1 ]]; then
		    steamcmd \\
		        +@sSteamCmdForcePlatformType windows \\
		        +force_install_dir "\$INSTALL_DIR" \\
		        +login anonymous \\
		        +app_update "\$APPID" validate \\
		        +quit || true
		fi

		if [[ ! -f "\$EXE" ]]; then
		    echo "Server executable not found at \$EXE" >&2
		    echo "SteamCMD download may have failed; check the log above." >&2
		    exit 1
		fi

		# 2. Assemble launch arguments. Note: -log/-newconsole are intentionally
		#    omitted so the server runs headless without Xvfb/Vulkan/DXVK.
		args=(
		    -useperfthreads
		    -MaxServerPlayers="\${MAX_PLAYERS:-6}"
		    -PORT="\${PORT:-7777}"
		    -QueryPort="\${QUERY_PORT:-27015}"
		    -SteamServerName="\${SERVER_NAME:-Abiotic Factor Server}"
		    -WorldSaveName="\${WORLD_SAVE_NAME:-Cascade}"
		)
		[[ -n "\${SERVER_PASSWORD:-}" ]] && args+=(-ServerPassword="\$SERVER_PASSWORD")
		[[ -n "\${ADMIN_PASSWORD:-}"  ]] && args+=(-AdminPassword="\$ADMIN_PASSWORD")
		[[ -n "\${EXTRA_ARGS:-}"      ]] && args+=(\$EXTRA_ARGS)

		# 3. Launch.
		cd "\$INSTALL_DIR/AbioticFactor/Binaries/Win64" || exit 1
		exec wine "\$EXE" "\${args[@]}"
	EOF

    # --- systemd service --------------------------------------------------
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/abiotic-factor.service" <<-EOF
		[Unit]
		Description=Abiotic Factor Dedicated Server
		After=network-online.target
		Wants=network-online.target

		[Service]
		Type=simple
		User=abiotic
		Group=abiotic
		WorkingDirectory=/var/lib/abiotic-factor
		Environment=HOME=/var/lib/abiotic-factor
		EnvironmentFile=/etc/abiotic-factor/server.conf
		ExecStart=/usr/lib/abiotic-factor/run
		# First start downloads several GB via SteamCMD; allow plenty of time.
		TimeoutStartSec=1800
		Restart=on-failure
		RestartSec=15

		[Install]
		WantedBy=multi-user.target
	EOF
}
