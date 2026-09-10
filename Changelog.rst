Changelog
=========

Tags
====

.. code-block:: text

	1.1.1 (2022-10-26) -> 10.4.0, (2026-09-02)
	234 commits.

Commits
=======


* 2026-09-02  : **10.4.0,**

.. code-block:: text

              - fix wrong tag

* 2026-09-02  : **10.1.10**

.. code-block:: text

              - **10.1.0**
            
                * linux client config output now uses tools provided by *wg-client*.
            
                  If you are using linux clients please install *wg-client* package.
                  It is much better than what was provied in earlier version of wg_tool.
            
                  wg-client provides resolv-manager along with post-up.sh and post-dn.sh.
                  These replace the wg-post-updn script which has therefore been dropped.
            
                  wg_tool now also produces wireguard-resolv.conf file since the
                  new post-up.sh / post-dn.sh scripts from wg-client require a resolv.conf file
                  to use while wireguard is running.
            
                  To get the updated configs and the resolv file use:
            
                    wg-tool --refresh
            
                * Add wg-client to the optional packages in PKGBUILD.
                * Package management is now done by meson/mesonpy (drop uv and pyproject.toml)
            
                * Disable color for --help as it looks bad on dark terminals.
 2026-08-25   ⋯

.. code-block:: text

              - update docs and Changelogs

* 2026-08-25  : **10.0.1**

.. code-block:: text

              - Fix typo in PKGBUILD using sha256sums not sha512
              - update docs and Changelogs

* 2026-08-25  : **10.0.0**

.. code-block:: text

              - **10.0.0**
            
                * Migrate to PyCidr from Cidr module.
            
                  Lots of network code simplication and it runs faster as well.
                  This does add tow new package dependencies coming from new *py-cidr* package:
            
                  * cidrtools
                  * cidrtools-cffi
            
                * Drop unused files
                * Switch to meson/uv for package building
                * Move examples to src/tests and add test runner to confirm the output
                  wireguard configs match a baseline set.
 2026-01-06   ⋯

.. code-block:: text

              - update Docs Changelogs

* 2026-01-06  : **9.2.4**

.. code-block:: text

              - PKGBUILD small change
 2026-01-05   ⋯

.. code-block:: text

              - update Docs Changelogs

* 2026-01-05  : **9.2.3**

.. code-block:: text

              - Docs - update manual build instructions for uv (including ubuntu)
              - update Docs Changelogs

* 2026-01-05  : **9.2.2**

.. code-block:: text

              - Fix typo in Docs/conf.py

* 2026-01-05  : **9.2.1**

.. code-block:: text

              - **9.2.1**
            
                * Code Reorg
                * Switch packaging from hatch to uv
                * Testing to confirm all working correctly on python 3.14.2
                  * 3.14 argparse introdiced color - it can be turned of with env PYTHON_COLORS=0.
                    The colors are not currently adjustable - is improved in python 3.15.
 2025-11-27   ⋯

.. code-block:: text

              - update Docs Changelogs

* 2025-11-27  : **9.1.0**

.. code-block:: text

              - Bug fix for issue #19: key roll fails, as reported by @hubbleshare
 2025-10-30   ⋯

.. code-block:: text

              - update Docs Changelogs

* 2025-10-30  : **9.0.1**

.. code-block:: text

              - * Add support for *IP Groups*.
            
                  This is helpful when managing routes for *groups* of users.
                  By designating some peers as members of an *ip-group*, network routes can now be
                  for specific groups. The IPs for an ip group must be a proper subnet
                  of the VPN network.
            
                  An ip group is created using the *--add-ip-group <name> <subnet(s)>* option.
            
                  Note that since an ip group is defined by the IP subnet of the vpn network, a
                  peer can only be a member of one group since it only has 1 IP.
            
                * Switch File Data from TOML to YAML format.
            
                  YAML is more robust than toml . Existing files are auto converted,
                  the first time version *9.x* is used.
                  *Edit* files now use yaml format as well. Docs updated to reflect this.
 2025-09-18   ⋯

.. code-block:: text

              - update Docs Changelogs

* 2025-09-18  : **8.2.0**

.. code-block:: text

              - Command line option completion optionally available
                  If desired, then python-argcomplete package should be installed.
 2025-09-17   ⋯

.. code-block:: text

              - update Docs Changelogs

* 2025-09-17  : **8.1.0**

.. code-block:: text

              - Fix bug checking working directory when not in the work dir
                Fix typo in gateway report which made handshake be dropped.
              - update Docs/wg_tool.pdf Docs/Changelogs
              - update Docs/wg_tool.pdf Docs/Changelogs

* 2025-09-17  : **8.0.0**

.. code-block:: text

              - Release 8.0.0
                New vpn info variable: dns_lookup_ipv6
                  When true, hostnames listed in "dns" lists are now queried for
                  IPv6 as well as IPv4 address(es). These are used in the wireguard configs.
                  Defaults to false.
 2025-09-16   ⋯

.. code-block:: text

              - fix couple typos
              - Add html link in Docs pointing to pre-build html docs.
                Remove old license file
              - update Docs/wg_tool.pdf Docs/Changelogs

* 2025-09-16  : **8.0.rc2**

.. code-block:: text

              - **Major Version 8.0.0**
            
                * Re-write pretty much from scratch. New design and fresh start.
                * Modern coding standards: PEP-8, PEP-257 and PEP-484 style and type annotations
                * Can now manage multiple VPNs
                * Each VPN has a number of *accounts* and each account may have multiple profiles.
                  Some profiles may be gateways (can be connected to) while others are clients
                  (connect to one or more gateways).
                * Support more use cases than earlier versions.
                * Provide walk through working examples of 3 common use cases
                * The enhancements require significant data format changes.
            
                  To make the upgrade as simple and easy as possble,
                  existing data from earlier versions can be auto migrated to
                  the new format with the *-migrate* option.
            
                * Network manipulations are now built on the *py-cidr* module.
            
                * New way to modify profiles.
            
                  The *--edit* option creates a text file. The file
                  uses standard TOML (key = value) format. Simply edit the file and then
                  use the *--merge* option to incorporate those changes.
            
                  This is simple and clean and makes it easy to modify whatever may be needed
                  in one quick edit and merge.
            
                  There are still many command line options which can be particularly helpful
                  making bulk changes.
            
                * Improved command line help.
            
                  Command line option help is now organized by category:
            
                    migrate, edit/merge, reporting, general and stored options.
            
                * Document most features including migration, importing, and
                  making modifications.
 2025-08-19   ⋯

.. code-block:: text

              - update Docs/Changelogs Docs/wg_tool.pdf

* 2025-08-19  : **7.5.1**

.. code-block:: text

              - update pyproject version
              - update Docs/Changelogs Docs/wg_tool.pdf

* 2025-08-19  : **7.5.0**

.. code-block:: text

              - update arch PKGBUILD to 7.5.0
              - Fix bug for --init. Issue #18 Reported by @Crisp-Casper
 2025-03-08   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2025-03-08  : **7.4.0**

.. code-block:: text

              - New option to set PersistentKeepAlive for user profiles.
                Sort options list printed by --help
                Update README
                Add user_keepalive (seconds) to saved options
                Server config : drop unused mod_time
 2024-12-31   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-12-31  : **7.3.0**

.. code-block:: text

              - Git tags are now signed.
                Add git signing key to Arch Package
                Bump python vers
 2024-10-22   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-10-22  : **7.2.0**

.. code-block:: text

              - Additional input protections in cidr utils
 2024-10-20   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-10-20  : **7.1.0**

.. code-block:: text

              - Use python 3 ipaddress in place of 3rd party netaddr module.
                Code reorg and some tidying
 2024-09-07   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-09-07  : **7.0.4**

.. code-block:: text

              - more readme tweaks
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-09-07  : **7.0.3**

.. code-block:: text

              - tweak RST formatting in readme
 2024-06-29   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-06-29  : **7.0.2**

.. code-block:: text

              - bug: -V,--version didnt print anything - fixed
 2024-06-28   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-06-28  : **7.0.1**

.. code-block:: text

              - Remove stray character from PKGBUILD; Add nftables dependency
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-06-28  : **7.0.0**

.. code-block:: text

              - - Split routing support via *--allowed_ips*
                    Gives ability to specify which networks use the vpn tunnel
            
                    New option: -aips, --allowed_ips
            
                    Applies to wireguard config *AllowedIps*
            
                    This is a string of comma separated cidr blocks or can be the word *default*.
                    Default is all packets use vpn - i.e. 0.0.0.0/0,::/0
            
                    Option can be used with new user profile or to modify an existing profile together
                    with *-mod* option.
            
                - general tidy ups
            
                - add missing contrib directory to installer scrript
            
                - Now uses sha3-384 to detect file changes (using python-cryptography module)
                  which wraps openssl
            
                - Update to require python 3.11 or greater
            
                - Restricted file permissions - new option, (*-fp, --fperms*), to ensure all files have appropriate
                  permissions.
                  Previous version this was always done - but it can be slow (esp. over NFS) so
                  now its an option to run if needed.
 2024-04-30   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-04-30  : **6.7.7**

.. code-block:: text

              - fresh tag

* 2024-04-30  : **6.7.6**

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf
              - Take Changelog "hack" out of PKGBUILD ... was a bad idea
 2024-04-29   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-04-29  : **6.7.5**

.. code-block:: text

              - one of those days ... another typo!
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-04-29  : **6.7.4**

.. code-block:: text

              - typo

* 2024-04-29  : **6.7.3**

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf
              - Improve pulling latest Changelog so pacman -Qc shows it
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-04-29  : **6.7.2**

.. code-block:: text

              - PKGBUILD change to get latest Changelog
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-04-29  : **6.7.1**

.. code-block:: text

              - Update version.py as our package tooling was updated
 2024-04-23   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-04-23  : **6.7.0**

.. code-block:: text

              - Adjust for upcoming python changes.
                Some argparse options have been deprecated in 3.12 and will be removed in 3.14
 2024-04-17   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-04-17  : **6.6.1**

.. code-block:: text

              - Package update: "pacman -Qc wg_tool" now shows the Changelog
 2024-01-19   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-19  : **6.6.0**

.. code-block:: text

              - version now includes released vs development
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-19  : **6.5.0**

.. code-block:: text

              - Remove githash from version
              - Closed github issue #17.
                update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-19  : **6.4.0**

.. code-block:: text

              - Add --version option
 2024-01-17   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-17  : **6.3.0**

.. code-block:: text

              - Simplify ip address manipulations a few lines to original now bug is fixed
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-17  : **6.2.0**

.. code-block:: text

              - Bugfix : generating IPs was skipping too many available blocks
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-17  : **6.1.0**

.. code-block:: text

              - Fix: update AllowedIPs with --ips_refresh
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-17  : **6.0.1**

.. code-block:: text

              - bump patch version for readme change
              - readme tweak
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-17  : **6.0.0**

.. code-block:: text

                  - Add support for multiple IP addresses in user profiles.
                    Addresses will now be taken from whichever networks are in server config.
                    cidr address for each network will have prefixlen_4 for IPv4 and prefixlen_6 for IPv6 networks.
                    prefixlen are settable with new options.
                    Existing user:profile (or -all) can have their IPs refreshed to pick up their new IPs from
                    server config. If you already have multiple networks or simply added them to Address variable in
                    configs/server/server.conf - then can refresh using:
                       wg-tool -mod -ips user_name:profile_name
                    or
                       wg-tool -mod -ips -all
 2024-01-13   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-13  : **5.7.2**

.. code-block:: text

              - Add ubuntu notes provided by Jack Duan (@jduan00 via github #13)
 2024-01-12   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-12  : **5.7.1**

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf
              - lint picking
 2024-01-11   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-11  : **5.7.0**

.. code-block:: text

              - Add -upd option to update user/profile endpoint when server config changes.
                  (closes GH issue #11)
                -mod option can now be used with -all
 2024-01-07   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2024-01-07  : **5.6.3**

.. code-block:: text

              - rst fix in readme

* 2024-01-07  : **5.6.2**

.. code-block:: text

              - fix readme typo

* 2024-01-07  : **5.6.1**

.. code-block:: text

              - small readme update
 2023-12-07   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2023-12-07  : **5.6.0**

.. code-block:: text

              - wg-peer-updn now saves additional copy of wg resolv.conf in resolv.conf.wg.
                Can be used by client when resume causes network restart to overwrites the wg resolv.conf.
                Used by wg-client package to "fix" dns after sleep/resume.
 2023-11-23   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2023-11-23  : **5.5.1**

.. code-block:: text

              - Improve description
              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2023-11-23  : **5.5.0**

.. code-block:: text

              - Change python build from poetry to hatch.
                  It is cleaner and simpler.
                Switch copyright lines to SPDX format
 2023-11-12   ⋯

.. code-block:: text

              - update Docs/Changelog.rst Docs/wg_tool.pdf

* 2023-11-12  : **5.4.1**

.. code-block:: text

              - Minor readme rst format change.
                Add wg_tool.pdf
 2023-09-30   ⋯

.. code-block:: text

              - update Docs/Changelog.rst

* 2023-09-30  : **5.3.4**

.. code-block:: text

              - Add sample output of server report to README

* 2023-09-30  : **5.3.3**

.. code-block:: text

              - Improve README
 2023-09-27   ⋯

.. code-block:: text

              - update Docs/Changelog.rst

* 2023-09-27  : **5.3.2**

.. code-block:: text

              - update Docs/Changelog.rst
              - Fix links in readme.
                Remove doc build dependency on myst-parser since no more mardown
 2023-09-26   ⋯

.. code-block:: text

              - update Docs/Changelog.rst

* 2023-09-26  : **5.3.1**

.. code-block:: text

              - Release as 5.3.1
              - fix rst list items in Changelog
              - update Docs/Changelog.rst

* 2023-09-26  : **5.3.0**

.. code-block:: text

              - Reorg docs - add Docs/dir with sphinx support
                update PKGBUILD for optional doc builds
                Migrate to rst from markdown
 2023-09-25   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-09-25  : **5.1.1**

.. code-block:: text

              - README - replace markdown url links with rst link notation
 2023-08-02   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-08-02  : **5.1.0**

.. code-block:: text

              - Improve code finding available client IPs to properly support IPv6.
                Client IPs are chosen from the server Address list in natural order. If you prefer clients
                get IPv6 addresses, those should be listed first. Similarly, if IPv4 is preferred, then put that first.
                Tidy to keep pylint clean
 2023-07-28   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-07-28  : **4.7.0**

.. code-block:: text

              - Fix import open_file buglet
 2023-05-18   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-05-18  : **4.6.0**

.. code-block:: text

              - install: switch from pip to python installer package. This adds optimized bytecode
              - update CHANGELOG.md

* 2023-05-18  : **4.5.3**

.. code-block:: text

              - PKGBUILD: build wheel back to using python -m build instead of poetry
 2023-05-17   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-05-17  : **4.5.2**

.. code-block:: text

              - Simplify Arch PKGBUILD and more closely follow arch guidelines
 2023-05-08   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-05-08  : **4.5.1**

.. code-block:: text

              - Add comment to README about linux using wg and ssh and MTU
 2023-05-02   ⋯

.. code-block:: text

              - typo
              - update CHANGELOG.md

* 2023-05-02  : **4.5.0**

.. code-block:: text

              - Add comment on philosophy of living at the head commit.
                Change README from markdown to restructured text

* 2023-04-15  : **4.4.0**

.. code-block:: text

              - update CHANGELOG.md
              - Only show user public key for "-rpt" when also using "-det".
                  Since we show user and profile name, the user key is not really needed
 2023-04-11   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-04-11  : **4.3.6**

.. code-block:: text

              - postup.nft script add extra line: ct status dnat accept - I saw a martial packat at firewall from vpn which was unexpected
                minor readme edit
                update project version
 2023-01-06   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2023-01-06  : **4.3.5**

.. code-block:: text

              - Add SPDX licensing lines
 2022-12-29   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-29  : **4.3.4**

.. code-block:: text

              - Add reminder in README to allow ip forwarding on wireguard server
 2022-12-28   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-28  : **4.3.3**

.. code-block:: text

              - Add brief networking note
 2022-12-26   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-26  : **4.3.2**

.. code-block:: text

              - Change default python interpreter location to /usr/bin/python3 (remove env).
                    This is also recommended by e.g. debian packaging guidelines (https://www.debian.org/doc/packaging-manuals/python-policy). While many distros (Arch, Fedora etc.) recommend /usr/bin/python - we keep python3 which will work on those and on debian until debian provides python (and not just python3).
 2022-12-25   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-25  : **4.3.1**

.. code-block:: text

              - Move archlinux dir to packaging.
                Add packaging/requirements.txt
                Update build dependencies in PKGBUILD
                Tweak README
 2022-12-20   ⋯

.. code-block:: text

              - tweak README
              - update CHANGELOG.md

* 2022-12-20  : **4.3.0**

.. code-block:: text

              - Change python to python3 (as per GH issue #5 on ubuntu/debian.
                Remove pip option from installer (--root-user-action=ignore)
              - indent fix
              - To help with older pre 3.9 python versions, provide files without match().
                They are in lib38. Copy to lib38/*.py lib/
 2022-12-14   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-14  : **4.2.0**

.. code-block:: text

              - update CHANGELOG.md
              - Installer now uses pip install
                PKGBUILD now uses poetry to build wheel
 2022-12-08   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-08  : **4.1.0**

.. code-block:: text

              - Server show_rpt was not treating inactive users/profiles properly - fixed
 2022-12-04   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-04  : **4.0.0**

.. code-block:: text

              - Stronger file access permissions to protect private data in configs.
                Changes to work_dir:
                    Backward compatible with previous version.
                    Now prefers to use */etc/wireguard/wg-tool* if possible, otherwise falls back to current directory.
                    Thanks to Yann Cardon
              - Improve comments in postup.nft including reference to alternate postup from Yann Cardon
              - Merge pull request #3 from ycardon/master
            
                Create postup-alternate.nft
              - Create postup-alternate.nft
            
                provides an other example of postup script with useful comments
 2022-12-03   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-12-03  : **3.7.0**

.. code-block:: text

              - bug: --list if username(s) given without profile. Now we list all profiles
 2022-12-01   ⋯

.. code-block:: text

              - update CHANGELOG.md
              - Typo in README fixed by @ycardon
              - Merge pull request #2 from ycardon/master
            
                small typo in the readme
              - small typo
            
                --add-users > --add_users
 2022-11-30   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-30  : **3.6.0**

.. code-block:: text

              - bug fix for --init
                Thanks to @ycardon - this fixes issue #1 : https://github.com/gene-git/wg_tool/issues/1
 2022-11-29   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-29  : **3.5.0**

.. code-block:: text

              - turn off test mode
              - update CHANGELOG.md

* 2022-11-29  : **3.4.0**

.. code-block:: text

              - Improve wg-peer-updn
                 - Rename existing resolv.conf when saving
                 - Add timestamp to wireguard resolv.conf
              - update CHANGELOG.md

* 2022-11-29  : **3.3.1**

.. code-block:: text

              - Small add to README
              - update CHANGELOG.md

* 2022-11-29  : **3.3.0**

.. code-block:: text

              - Improve README
 2022-11-28   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-28  : **3.2.0**

.. code-block:: text

              - typo
              - update CHANGELOG.md

* 2022-11-28  : **3.1.0**

.. code-block:: text

              - fix typo creating new user profile with -dnssrc/-dnslin
              - tweak readme
              - update CHANGELOG.md

* 2022-11-28  : **3.0.0**

.. code-block:: text

                  - Adds 3 new options:
                     - --mod_users : modify existing user profile (with --dns_search and --dns_linux)
                     - --dns_search : adds support for dns search domain list
                     - --dns_linux : adds support for managing resolv.conf instead of relying on qg-quick/resolconf
 2022-11-24   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-24  : **2.1.0**

.. code-block:: text

               - - improve error msg
                 - Check conf before using it - added when auto updating older configs using mtime of config
                 - minor tweak to bash variable check in install script
 2022-11-11   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-11  : **2.0.0**

.. code-block:: text

              - list users report now sorts by user name
                Add support for tracking config modification date-time. mod_time displayed in list user report
 2022-11-08   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-08  : **1.7.5**

.. code-block:: text

              - Improve handling of booelan False vs None in pre-file-write dictionary cleaner
 2022-11-07   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-07  : **1.7.4**

.. code-block:: text

              - tweak readme
 2022-11-04   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-11-04  : **1.7.3**

.. code-block:: text

              - add poetry back to PKGBUILD makedepends
              - update CHANGELOG.md

* 2022-11-04  : **1.7.2**

.. code-block:: text

              - change installer to use bash array for app list (even tho we onlly have 1 here)
                tweak readme
 2022-10-31   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-10-31  : **1.7.1**

.. code-block:: text

              - Change build from poetry/pip to python -m build/installer
              - update CHANGELOG.md

* 2022-10-31  : **1.7.0**

.. code-block:: text

              - Add support for python 3.11 tomllib
 2022-10-30   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-10-30  : **1.6.1**

.. code-block:: text

              - update readme
              - update CHANGELOG.md

* 2022-10-30  : **1.6.0**

.. code-block:: text

              - -rpt now lists missing users/profiles from running server
              - update CHANGELOG.md

* 2022-10-30  : **1.5.0**

.. code-block:: text

              - Add --details
                Modifes -l, -rpt and -rrpt to provide detailed information in addition to the summary.
 2022-10-29   ⋯

.. code-block:: text

              - update CHANGELOG.md

* 2022-10-29  : **1.4.0**

.. code-block:: text

              - report: handle cases where running server has old user key and other edge cases
              - update CHANGELOG.md

* 2022-10-29  : **1.3.2**

.. code-block:: text

              - add --run_show_rpt. Similar to --show_rpt, but runs wg-tool
              - update CHANGELOG.md

* 2022-10-29  : **1.3.1**

.. code-block:: text

              - bug fix: -inact user:prof made user inactive not just prof
              - update CHANGELOG.md

* 2022-10-29  : **1.3.0**

.. code-block:: text

              - Add new option --work_dir
                Refactor and tidy code up some
 2022-10-28   ⋯

.. code-block:: text

              - upd changelog
              - tweak readme
 2022-10-27   ⋯

.. code-block:: text

              - tweak readme and sync PKGBUILD
              - upd changelog

* 2022-10-27  : **1.2.3**

.. code-block:: text

              - Add mising packages to PKGBUILD depends (thank you @figue on aur)
              - upd changelog

* 2022-10-27  : **1.2.2**

.. code-block:: text

              - duh - turn off debugger .. sorry
              - markdown newline fix
              - word smith readme
 2022-10-26   ⋯

.. code-block:: text

              - update changelog

* 2022-10-26  : **1.2.1**

.. code-block:: text

              - update project vers
              - actually add the code to make wg_show report :)

* 2022-10-26  : **1.2.0**

.. code-block:: text

              - Adds support to parse output of wg show and provide user/profile names
              - Add new/coming soon section to readme
              - readme - aur package now avail
              - update changelog

* 2022-10-26  : **1.1.1**

.. code-block:: text

              - proj vers update
              - installer: share archlinux into /usr/share/wg_tool
              - Ready to share


