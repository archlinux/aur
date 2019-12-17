# Change Log

Notable changes for [autodl-irssi](https://github.com/autodl-community/autodl-irssi).


## [v2.6.1](https://github.com/autodl-community/autodl-irssi/releases/tag/v2.6.1) (2019-10-28)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/v2.6.0...v2.6.1)

### Fixed

* Improper support for newer versions of ``Net::SSLeay``.


## [v2.6.0](https://github.com/autodl-community/autodl-irssi/releases/tag/v2.6.0) (2019-10-28)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/v2.5.0...v2.6.0)

### Added

* ``InfoName`` macro.
* Support for newer versions of ``Net::SSLeay``.


## [v2.5.0](https://github.com/autodl-community/autodl-irssi/releases/tag/v2.5.0) (2019-02-06)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/v2.4.0...v2.5.0)

### Added

* UHD Blu-Ray constant.


## [v2.4.0](https://github.com/autodl-community/autodl-irssi/releases/tag/v2.4.0) (2018-09-08)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/v2.3.0...v2.4.0)

**The maintainer no longer provides support. Look to other users for help.**


## [v2.3.0](https://github.com/autodl-community/autodl-irssi/releases/tag/v2.3.0) (2018-03-10)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/v2.2.0...v2.3.0)

### Added

* Add "h264 10-bit to constants.
* Add constant group for h265/x265 10-bit.
* Add "Lossless 24-bit" to constants.
* Add WMA to constants.
* Add TrueHD to constants.


## [v2.2.0](https://github.com/autodl-community/autodl-irssi/releases/tag/v2.2.0) (2018-01-30)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/v2.1.0...v2.2.0)

### Changed

* Change censor placeholders to be more specific.
* Make auto updates the default.

### Fixed

* Make censor regex work with or without trailing slash.
* Don't overwrite already set variables in auto extractor.


## [v2.1.0](https://github.com/autodl-community/autodl-irssi/releases/tag/v2.1.0) (2018-01-19)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v2.0.1...v2.1.0)

### Added

* Add 4k alias for 2160p resolution.

### Changed

* Split up remux encoders.
* Use proper size unit prefixes in status messages.


## [community-v2.0.1](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v2.0.1) (2017-12-14)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v2.0.0...community-v2.0.1)

### Changed

* Revert "Allow overriding torrent action settings in a filter without needing to set them all".


## [community-v2.0.0](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v2.0.0) (2017-12-12)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.65...community-v2.0.0)

### Added

* Add h265 remux to constants.
* Add test upload-type.

### Changed

* Allow overriding torrent action settings in a filter without needing to set them all.
* Deprecate autodl2.cfg.

### Removed

* Remove support for allowed option.
* Removed support for /etc/autodl.cfg.

### Fixed

* Fix smart-episode option ignoring proper/repack.


## [community-v1.65](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.65) (2017-08-30)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.64...community-v1.65)

### Added

* Add 2160p resolution to constants.

### Fixed

* Fix bad subroutine references.


## [community-v1.64](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.64) (2017-03-18)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.63...community-v1.64)

### Added

* Add HEVC/x265 constants.

### Fixed

* Fixed update callback references.


## [community-v1.63](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.63) (2017-03-09)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.62...community-v1.63)

### Changed

* Add release to download history earlier in the process.

### Fixed

* Fix smart-episode logic.


## [community-v1.62](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.62) (2016-03-14)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.61...community-v1.62)

### Added

* Add smart-episode filter option.


## [community-v1.61](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.61) (2016-01-25)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.60...community-v1.61)

### Added

* Add priority filter option.
* Add message for successful loading of configuration files.

### Changed

* Changed method for matching release groups.


## [community-v1.60](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.60) (2015-10-01)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.54...community-v1.60)

### Changed

* Add warning message for using bare wildcards in filter options. Filters using bare wildcards will no longer work.
* Change updater to use GitHub's Releases API.


## [community-v1.54](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.54) (2015-04-30)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.53...community-v1.54)

### Added

* Add regex for sensitive data censoring.
* Add SNI support to SSLSocket.


## [community-v1.53](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.53) (2015-04-16)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.52...community-v1.53)

### Changed

* Re-add '-' to replacement list for canonicalization.
* Change rTorrent commands/mehtods to use new style.


## [community-v1.52](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.52) (2015-03-13)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.51...community-v1.52)

### Added

* Add match-release-groups filter option. This should be used instead of release-groups.

### Fixed

* Fix except-release groups filter option.


## [community-v1.51](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.51) (2015-02-25)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.50...community-v1.51)

### Added

* Add except-release-groups filter options.
* Add use-regex option to Option and Filter headers. This allows the use of regex syntax for match/except-releases filter options.
* Add advanced-output-sites option.

### Changed

* Separate advanced output functionality from the output-level option. Previously, output-level=5 would output variables captured from announces. This functionality is now handled by the advanced-output-sites option.


## [community-v1.50](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.50) (2015-01-02)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.46...community-v1.50)

### Added

* Add containers filter option.
* Add release-groups filter option.

### Changed

* Remove torrent size message.
* Move max-download message to only happen when a release is fully matched.


## [community-v1.46](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.46) (2014-08-24)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.45...community-v1.46)

### Added

* Add DVD-R to constants.
* Add HDCAM group to constants.
* Add HDTS group to constants.
* Add origins filter option.

### Changed

* Removed faulty assumptions from release name auto extractor. Some were outdated. Some caused invalid values. This specifically causes issues with SD resolution releases where the resolution isn't announced separately by the tracker.


## [community-v1.45](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.45) (2014-05-15)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.44...community-v1.45)

### Added

* Add CTCP ACTION handling.


## [community-v1.44](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.44) (2014-04-18)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.43...community-v1.44)

### Added

* Add 10-bit x264 constant group.

### Changed

* Change update check interval to 24 hours.
* Move update hosting to cloud server.


## [community-v1.43](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.43) (2014-01-13)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.42...community-v1.43)

### Added

* Added more source constants.

### Changed

* Improve /autodl whatsnew output.


## [community-v1.42](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.42) (2013-12-17)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.41...community-v1.42)

### Added

* Add forever to max-download-per filter option.

### Changed

* Make tracker updates follow update-check rules.
* Improve update messages.
* Make 'not downloaded' message more noticeable.
* Separate WEB-DL and WEBRip constant groups.
* Make new slash commands available to gui-server.


## [community-v1.41](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.41) (2013-08-14)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.40...community-v1.41)

### Added

* Add MPEG2 Remux constant group.
* Add /autodl reloadtrackers command.
* Add /autodl reload command.
* Add /autodl version command.
* Add hour to max-download-per filter option.

### Changed

* Remove trackers into separate repository and add as submodule.
* Change max-downloads to work without max-downloads-per.
* Delete removed tracker files on update.


## [community-v1.40](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.40) (2013-05-15)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.35...community-v1.40)

### Added

* Add Beathau5 tracker.
* Add macro support to upload-watch-dir.
* Add upload-delay-secs filter option.
* Add irssi eval command support.
* Add close-nickserv option to IRC header.
* Add download-duplicates filter option.

### Changed

* Change PreToMe to use passkey.
* Improve ep/season parsing logic.
* Add DIGEST::SHA compat.
* Add count output for max-download filters.

### Fixed

* Update IRC info for My Anonamouse.
* Remove FTN deobfuscation.


## [community-v1.35](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.35) (2013-04-16)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.34...community-v1.35)

### Added

* Add scene and max-pretime filter options to FunFile.
* Add freeleech filter option to IPTorrents.
* Add server-password option to IRC header.
* Add bnc option to server header.

### Changed

* Change Blackcats to use passkey.
* Add ignore to GazelleGames.
* Add ignores to PTN.
* Add ignore to Empornium.
* Change authkey to passkey in FunFile.

### Removed

* Remove HDBits tracker

### Fixed

* Force SSL for Awesome-HD.
* Force SSL for Blackcats.
* Force SSL for IPtorrents.
* Force SSL for Waffles.
* Update regex and download URL for AnimeBytes.
* Update PTN.
* Move AVC to proper constant group.
* Update server name for AnimeBytes.


## [community-v1.34](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.34) (2013-02-17)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.33...community-v1.34)

### Added

* Re-add filelist.ro.
* Add Empornium tracker.
* Add torrent size capture to GFTracker.
* Add GazelleGames tracker.
* Add AnimeBytes tracker.
* Add The Dark Syndicate tracker.
* Re-add PreToMe with updated info.
* Add TSTN tracker.
* Add log-scores filter option.
* Add log-scores filter option to What.CD.
* Add log-scores filter option to BaconBits.
* Add freeleech filter option to What.CD.
* Add freeleech-percents filter option.
* Add freeleech-percents filter option to Awesome-HD.

### Changed

* Change update URL to Google Code.

### Removed

* Remove bitGAMER.

### Fixed

* Force SSL for RevolutionTT.
* Update channel name for GazelleGames.
* Update download URL for Animebytes.
* Update PussyTorrents.


## [community-v1.33](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.33) (2012-10-31)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/community-v1.32...community-v1.33)

### Added

* Add remux formats to constants.
* Add freeleech filter option.
* Add freeleech filter option to PassThePopcorn.

### Changed

* Change IPTorrents to use passkey.
* Modify Awesome-HD.

### Removed
* Remove dead trackers.

### Fixed

* Update RevolutionTT.
* Update Waffles.
* Update PTN.


## [community-v1.32](https://github.com/autodl-community/autodl-irssi/releases/tag/community-v1.32) (2012-10-28)

[Commits](https://github.com/autodl-community/autodl-irssi/compare/c933f40d103b202214525c850859b31711da9bae...community-v1.32)

* Initial fork from original project.
