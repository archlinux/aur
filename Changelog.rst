Changelog
=========

**[6.7.2] ----- 2024-04-29** ::

	    PKGBUILD change to get latest Changelog
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.7.1] ----- 2024-04-29** ::

	    Update version.py as our package tooling was updated
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.7.0] ----- 2024-04-23** ::

	    Adjust for upcoming python changes.
	    Some argparse options have been deprecated in 3.12 and will be removed in 3.14
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.6.1] ----- 2024-04-17** ::

	    Package update: "pacman -Qc wg_tool" now shows the Changelog
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.6.0] ----- 2024-01-19** ::

	    version now includes released vs development
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.5.0] ----- 2024-01-19** ::

	    Remove githash from version
	    Closed github issue #17.
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.4.0] ----- 2024-01-19** ::

	    Add --version option
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.3.0] ----- 2024-01-17** ::

	    Simplify ip address manipulations a few lines to original now bug is fixed
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.2.0] ----- 2024-01-17** ::

	    Bugfix : generating IPs was skipping too many available blocks
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.1.0] ----- 2024-01-17** ::

	    Fix: update AllowedIPs with --ips_refresh
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.0.1] ----- 2024-01-17** ::

	    bump patch version for readme change
	    readme tweak
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[6.0.0] ----- 2024-01-17** ::

	        Add support for multiple IP addresses in user profiles.
	        Addresses will now be taken from whichever networks are in server config.
	        cidr address for each network will have prefixlen_4 for IPv4 and prefixlen_6 for IPv6 networks.
	        prefixlen are settable with new options.
	        Existing user:profile (or -all) can have their IPs refreshed to pick up their new IPs from
	        server config. If you already have multiple networks or simply added them to Address variable in
	        configs/server/server.conf - then can refresh using:
	           wg-tool -mod -ips user_name:profile_name
	        or
	           wg-tool -mod -ips -all
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.7.2] ----- 2024-01-13** ::

	    Add ubuntu notes provided by Jack Duan (@jduan00 via github #13)
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.7.1] ----- 2024-01-12** ::

	    update Docs/Changelog.rst Docs/wg_tool.pdf
	    lint picking
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.7.0] ----- 2024-01-11** ::

	    Add -upd option to update user/profile endpoint when server config changes.
	      (closes GH issue #11)
	    -mod option can now be used with -all
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.6.3] ----- 2024-01-07** ::

	    rst fix in readme


**[5.6.2] ----- 2024-01-07** ::

	    fix readme typo


**[5.6.1] ----- 2024-01-07** ::

	    small readme update
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.6.0] ----- 2023-12-07** ::

	    wg-peer-updn now saves additional copy of wg resolv.conf in resolv.conf.wg.
	    Can be used by client when resume causes network restart to overwrites the wg resolv.conf.
	    Used by wg-client package to "fix" dns after sleep/resume.
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.5.1] ----- 2023-11-23** ::

	    Improve description
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.5.0] ----- 2023-11-23** ::

	    Change python build from poetry to hatch.
	      It is cleaner and simpler.
	    Switch copyright lines to SPDX format
	    update Docs/Changelog.rst Docs/wg_tool.pdf


**[5.4.1] ----- 2023-11-12** ::

	    Minor readme rst format change.
	    Add wg_tool.pdf
	    update Docs/Changelog.rst


**[5.3.4] ----- 2023-09-30** ::

	    Add sample output of server report to README


**[5.3.3] ----- 2023-09-30** ::

	    Improve README
	    update Docs/Changelog.rst


**[5.3.2] ----- 2023-09-27** ::

	    update Docs/Changelog.rst
	    Fix links in readme.
	    Remove doc build dependency on myst-parser since no more mardown
	    update Docs/Changelog.rst


**[5.3.1] ----- 2023-09-26** ::

	    Release as 5.3.1
	    fix rst list items in Changelog
	    update Docs/Changelog.rst


**[5.3.0] ----- 2023-09-26** ::

	    Reorg docs - add Docs/dir with sphinx support
	    update PKGBUILD for optional doc builds
	    Migrate to rst from markdown
	    update CHANGELOG.md


**[5.1.1] ----- 2023-09-25** ::

	    README - replace markdown url links with rst link notation
	    update CHANGELOG.md


**[5.1.0] ----- 2023-08-02** ::

	    Improve code finding available client IPs to properly support IPv6.
	    Client IPs are chosen from the server Address list in natural order. If you prefer clients
	    get IPv6 addresses, those should be listed first. Similarly, if IPv4 is preferred, then put that first.
	    Tidy to keep pylint clean
	    update CHANGELOG.md


**[4.7.0] ----- 2023-07-28** ::

	    Fix import open_file buglet
	    update CHANGELOG.md


**[4.6.0] ----- 2023-05-18** ::

	    install: switch from pip to python installer package. This adds optimized bytecode
	    update CHANGELOG.md


**[4.5.3] ----- 2023-05-18** ::

	    PKGBUILD: build wheel back to using python -m build instead of poetry
	    update CHANGELOG.md


**[4.5.2] ----- 2023-05-17** ::

	    Simplify Arch PKGBUILD and more closely follow arch guidelines
	    update CHANGELOG.md


**[4.5.1] ----- 2023-05-08** ::

	    Add comment to README about linux using wg and ssh and MTU
	    typo
	    update CHANGELOG.md


**[4.5.0] ----- 2023-05-02** ::

	    Add comment on philosophy of living at the head commit.
	    Change README from markdown to restructured text


**[4.4.0] ----- 2023-04-15** ::

	    update CHANGELOG.md
	    Only show user public key for "-rpt" when also using "-det".
	      Since we show user and profile name, the user key is not really needed
	    update CHANGELOG.md


**[4.3.6] ----- 2023-04-11** ::

	    postup.nft script add extra line: ct status dnat accept - I saw a martial packat at firewall from vpn which was unexpected
	    minor readme edit
	    update project version
	    update CHANGELOG.md


**[4.3.5] ----- 2023-01-06** ::

	    Add SPDX licensing lines
	    update CHANGELOG.md


**[4.3.4] ----- 2022-12-29** ::

	    Add reminder in README to allow ip forwarding on wireguard server
	    update CHANGELOG.md


**[4.3.3] ----- 2022-12-28** ::

	    Add brief networking note
	    update CHANGELOG.md


**[4.3.2] ----- 2022-12-26** ::

	    Change default python interpreter location to /usr/bin/python3 (remove env).
	        This is also recommended by e.g. debian packaging guidelines (https://www.debian.org/doc/packaging-manuals/python-policy). While many distros (Arch, Fedora etc.) recommend /usr/bin/python - we keep python3 which will work on those and on debian until debian provides python (and not just python3).
	    update CHANGELOG.md


**[4.3.1] ----- 2022-12-25** ::

	    Move archlinux dir to packaging.
	    Add packaging/requirements.txt
	    Update build dependencies in PKGBUILD
	    Tweak README
	    tweak README
	    update CHANGELOG.md


**[4.3.0] ----- 2022-12-20** ::

	    Change python to python3 (as per GH issue #5 on ubuntu/debian.
	    Remove pip option from installer (--root-user-action=ignore)
	    indent fix
	    To help with older pre 3.9 python versions, provide files without match().
	    They are in lib38. Copy to lib38/*.py lib/
	    update CHANGELOG.md


**[4.2.0] ----- 2022-12-14** ::

	    update CHANGELOG.md
	    Installer now uses pip install
	    PKGBUILD now uses poetry to build wheel
	    update CHANGELOG.md


**[4.1.0] ----- 2022-12-08** ::

	    Server show_rpt was not treating inactive users/profiles properly - fixed
	    update CHANGELOG.md


**[4.0.0] ----- 2022-12-04** ::

	    Stronger file access permissions to protect private data in configs.
	    Changes to work_dir:
	        Backward compatible with previous version.
	        Now prefers to use */etc/wireguard/wg-tool* if possible, otherwise falls back to current directory.
	        Thanks to Yann Cardon
	    Improve comments in postup.nft including reference to alternate postup from Yann Cardon
	Merge: f74aa16bc2 26e957cd19
	    Merge pull request #3 from ycardon/master
	    Create postup-alternate.nft
	    Create postup-alternate.nft
	    provides an other example of postup script with useful comments
	    update CHANGELOG.md


**[3.7.0] ----- 2022-12-03** ::

	    bug: --list if username(s) given without profile. Now we list all profiles
	    update CHANGELOG.md
	    Typo in README fixed by @ycardon
	Merge: 8c05f936df 6dcc5b6459
	    Merge pull request #2 from ycardon/master
	    small typo in the readme
	    small typo
	    --add-users > --add_users
	    update CHANGELOG.md


**[3.6.0] ----- 2022-11-30** ::

	    bug fix for --init
	    Thanks to @ycardon - this fixes issue #1 : https://github.com/gene-git/wg_tool/issues/1
	    update CHANGELOG.md


**[3.5.0] ----- 2022-11-29** ::

	    turn off test mode
	    update CHANGELOG.md


**[3.4.0] ----- 2022-11-29** ::

	    Improve wg-peer-updn
	     - Rename existing resolv.conf when saving
	     - Add timestamp to wireguard resolv.conf
	    update CHANGELOG.md


**[3.3.1] ----- 2022-11-29** ::

	    Small add to README
	    update CHANGELOG.md


**[3.3.0] ----- 2022-11-29** ::

	    Improve README
	    update CHANGELOG.md


**[3.2.0] ----- 2022-11-28** ::

	    typo
	    update CHANGELOG.md


**[3.1.0] ----- 2022-11-28** ::

	    fix typo creating new user profile with -dnssrc/-dnslin
	    tweak readme
	    update CHANGELOG.md


**[3.0.0] ----- 2022-11-28** ::

	        Adds 3 new options:
	         - --mod_users : modify existing user profile (with --dns_search and --dns_linux)
	         - --dns_search : adds support for dns search domain list
	         - --dns_linux : adds support for managing resolv.conf instead of relying on qg-quick/resolconf
	    update CHANGELOG.md


**[2.1.0] ----- 2022-11-24** ::

	     - improve error msg
	     - Check conf before using it - added when auto updating older configs using mtime of config
	     - minor tweak to bash variable check in install script
	    update CHANGELOG.md


**[2.0.0] ----- 2022-11-11** ::

	    list users report now sorts by user name
	    Add support for tracking config modification date-time. mod_time displayed in list user report
	    update CHANGELOG.md


**[1.7.5] ----- 2022-11-08** ::

	    Improve handling of booelan False vs None in pre-file-write dictionary cleaner
	    update CHANGELOG.md


**[1.7.4] ----- 2022-11-07** ::

	    tweak readme
	    update CHANGELOG.md


**[1.7.3] ----- 2022-11-04** ::

	    add poetry back to PKGBUILD makedepends
	    update CHANGELOG.md


**[1.7.2] ----- 2022-11-04** ::

	    change installer to use bash array for app list (even tho we onlly have 1 here)
	    tweak readme
	    update CHANGELOG.md


**[1.7.1] ----- 2022-10-31** ::

	    Change build from poetry/pip to python -m build/installer
	    update CHANGELOG.md


**[1.7.0] ----- 2022-10-31** ::

	    Add support for python 3.11 tomllib
	    update CHANGELOG.md


**[1.6.1] ----- 2022-10-30** ::

	    update readme
	    update CHANGELOG.md


**[1.6.0] ----- 2022-10-30** ::

	    -rpt now lists missing users/profiles from running server
	    update CHANGELOG.md


**[1.5.0] ----- 2022-10-30** ::

	    Add --details
	    Modifes -l, -rpt and -rrpt to provide detailed information in addition to the summary.
	    update CHANGELOG.md


**[1.4.0] ----- 2022-10-29** ::

	    report: handle cases where running server has old user key and other edge cases
	    update CHANGELOG.md


**[1.3.2] ----- 2022-10-29** ::

	    add --run_show_rpt. Similar to --show_rpt, but runs wg-tool
	    update CHANGELOG.md


**[1.3.1] ----- 2022-10-29** ::

	    bug fix: -inact user:prof made user inactive not just prof
	    update CHANGELOG.md


**[1.3.0] ----- 2022-10-29** ::

	    Add new option --work_dir
	    Refactor and tidy code up some
	    upd changelog
	    tweak readme
	    tweak readme and sync PKGBUILD
	    upd changelog


**[1.2.3] ----- 2022-10-27** ::

	    Add mising packages to PKGBUILD depends (thank you @figue on aur)
	    upd changelog


**[1.2.2] ----- 2022-10-27** ::

	    duh - turn off debugger .. sorry
	    markdown newline fix
	    word smith readme
	    update changelog


**[1.2.1] ----- 2022-10-26** ::

	    update project vers
	    actually add the code to make wg_show report :)


**[1.2.0] ----- 2022-10-26** ::

	    Adds support to parse output of wg show and provide user/profile names
	    Add new/coming soon section to readme
	    readme - aur package now avail
	    update changelog


**[1.1.1] ----- 2022-10-26** ::

	    proj vers update
	    installer: share archlinux into /usr/share/wg_tool
	    Ready to share


