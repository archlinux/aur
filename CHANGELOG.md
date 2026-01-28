# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Save unit file in runtime
- Options on description menu
- Show interface on properties list

## [2.12.3] - 2026-01-28

### Fix

- Dark and Light Style
- Delay proxy startup

## [2.12.1] - 2026-01-27

### Fix

- Translations

## [2.12.0] - 2026-01-27

### Added

- Fine tune the Proxy Method Calls and Actions through the Preferences
- Lazy Start the Proxy
- Refresh the Unit Status on selection

### Fix

- Fix Flatpak save file in home directory (make a warning)
- Password dialog gets overlapped by Sysd Manager on every start [Issue 35](https://github.com/plrigaux/sysd-manager/issues/35)

## [2.11.5] - 2026-01-15

### Fix

- Show line number menu option sync with preference.

## [2.11.4] - 2026-01-14

### Added

- Menu item to toggle Show Line Numbers on unit file panel.

## [2.11.3] - 2026-01-13

### Added

- Toggle display total summary option in the unit list popup menu

### Fixed

- Improve Spacing in Top-Bottom Layout [Issue 31](https://github.com/plrigaux/sysd-manager/issues/31)

## [2.11.2] - 2026-01-13

### Fixed

- metainfo add vsc browser url
- Unit search bar UX improvements (tooltips, icons, sensitivity, ...)

## [2.11.1] - 2026-01-12

### Added

- Find in text can constrain on whole word

### Changed

- Find in text feature handle text update optimizations (e.g. for the journal)

## [2.11.0] - 2026-01-10

### Added

- Find in text feature on the Unit's Description, File, Dependencies and Journal

### Fixed

- The AUR package build

## [2.10.5] - 2025-12-20

### Changed

- More actions side panel become a pop-up

## [2.10.0] - 2025-12-18

### Added

- Can create drop-in files
- Can remove drop-in files
- Can reload systemd manager configuration at system and user session level
- Clean, Freeze and Thaw actions privilege elevations (Unavailable with Flatpak)

## [2.9.2] - 2025-11-22

### Fixed

- Fix column filter clean menu option

## [2.9.1] - 2025-11-20

### Added

- Translation languages cs and it

### Fixed

- UI consistency https://github.com/plrigaux/sysd-manager/issues/28
- Show no unit file when unit isn't selected

## [2.9.0] - 2025-11-18

### Added

- Can see and edit current unit' drop-ins

## [2.8.1] - 2025-11-13

### Added

- Unit description wrap text preference option

### Fixed

- Version description

## [2.8.0] - 2025-11-13

### Added

- Can filter on unset values

### Fixed

- Column button in the preferences panel

## [2.7.2] - 2025-11-11

### Fixed

- Column title that removed continuously first letter each time, it stop the issue but don't recover the damage. To fix, manually edit the title Ctrl+R in the Property Selector or wipe out the config file (~/.config/sysd-manager/unit_columns.toml).

## [2.7.1] - 2025-11-10

### Added

- Allow filtering on all other unit properties
- Add a filter marker on browser column
- Allow string filter to filter on start, end or middle

### Fixed

- Missing Icon in "More..." Button Issue https://github.com/plrigaux/sysd-manager/issues/27

## [2.6.4] - 2025-11-5

### Fixed

- Unit journal events displayed twice. Issue https://github.com/plrigaux/sysd-manager/issues/26

## [2.6.3] - 2025-11-4

### Fixed

- System unit takes precedence on User Session units. Issue https://github.com/plrigaux/sysd-manager/issues/25

## [2.6.2] - 2025-11-4

### Fixed

- UX, extra controls side panel now scrolls

## [2.6.1] - 2025-11-3

### Added

- Display unit properties dialog shortcut (Ctrl+p)

### Fixed

- Translation keys
- Unit file path handling

## [2.6.0] - 2025-10-24

### Added

- Popup menu reenable option

### Fixed

- Sorting on user defined unit's property columns wasn't working at initiation time

## [2.5.2] - 2025-10-23

### Changed

- pt_BR translation
- zh_Hans translation

### Fixed

- Multiple scrolled windows behavior regarding the vertical height (second try)

## [2.5.0] - 2025-10-21

### Added

- Reload option in the unit popup menu

### Fixed

- Multiple scrolled windows behavior regarding the vertical height

## [2.4.0] - 2025-10-18

### Added

- Disable & Enable option in the popup menu

### Fixed

- Popup menu appearance issues
- Inactive unit display style behavior

## [2.3.0] - 2025-10-17

### Added

- Sorting on user defined unit's property columns

## [2.2.0] - 2025-10-15

### Added

- Column manager UX improvements
  - Focus on added property
  - Focus on property's column when open from browser
  - Show a Toast on added property
  - Keep track of column order
- Translation German
- Translation Portuguese Brazil

## [2.1.0] - 2025-10-13

### Added

- Journal ANSI color codes parsing and rendering https://github.com/plrigaux/sysd-manager/issues/23
- Save full browser column context in a user config file

## [2.0.0] - 2025-10-07

### Added

- Customize unit properties display in the browser
- Make the inactive units browser style change in real time

### Changed

- Improve some memory management
- Refactor some multi-thread locks
- Support GTK 4.20 (Gnome 49)

### Fixed

- Flatpak version to be able to read and save in home directory

## [1.32.3] - 2025-09-12

### Fixed

- Saving file (without privilege elevation) doesn't overwrite completely the old file. https://github.com/plrigaux/sysd-manager/issues/21

## [1.32.2] - 2025-09-11

### Changed

- Translations
- Improve some unit properties retrieving

## [1.32.1] - 2025-08-30

### Changed

- Unit browser right click popup menu look and feel

## [1.32.0] - 2025-08-29

### Added

- Unit browser right click popup menu

### Changed

- Translations

## [1.31.4] - 2025-08-20

### Added

- Uk Translations
- Testing dbus command lines

## [1.31.3] - 2025-08-18

### Changed

- Translations

## [1.31.1] - 2025-08-14

### Fixed

- Filter UI behavior

## [1.31.0] - 2025-08-13

### Changed

- Sub state filter

## [1.30.5] - 2025-06-19

### Added

- Translation of desktop file

### Fixed

- Transient typo

## [1.30.1] - 2025-06-18

### Added

- New unit file controls : Preset, Disable, Reenable and Link
- Portuguese Brazil translation strings
- French translation strings
- Translators Credits

## [1.29.2] - 2025-06-13

### Fixed

- Translation making application to crash

## [1.29.0] - 2025-06-09

### Added

- Ability to start unit after enabling it
- French translation
- Ability for translators to translate Sysd Manager

## [1.28.0] - 2025-06-01

### Added

- New menu option: Watch Systemd signals

## [1.27.2] - 2025-05-30

### Fixed

- Unit dependencies navigation crash
- Action result message

## [1.27.0] - 2025-05-29

### Added

- Add Mask unit more options

### Fixed

- Enable unit file Dialog save context mixed up
- 1.27.1 Mask unit dialog behavior malfunction

## [1.26.0] - 2025-05-28

### Added

- Enable unit file

### Changed

- Remove button destructive style for clear filter

## [1.25.0] - 2025-05-22

### Added

- Feature to enable new journal entries continuous print as they are appended to the
  journal

### Changed

- UX Better error dialog message on not authorized for actions: clean, freeze and thaw
- Named Damglador in the Acknowledgements section

## [1.24.2] - 2025-05-10

### Fixed

- Application crash when the preference for the unit file browser «Display colors» is
  set to Off

## [1.24.1] - 2025-04-28

### Added

- A clear all filters button on the filter panel

### Fixed

- A possible starting crash

## [1.24.0] - 2025-04-18

### Added

- Mask and Unmask a Unit functionnality

## [1.23.0] - 2025-04-14

### Added

- List the Journal Boots

### Changed

- UX Journal Entries Filtered on Boot Direct Selection

### Fixed

- Clear Filters Menu option
- UX Unit search entry got focus when appearing

## [1.22.4] - 2025-04-11

### Fixed

- Unit Filter Entry get focus when appearing

## [1.22.1] - 2025-04-10

### Added

- Unit List Summary Totals

### Changed

- Panel navigator look and feel

## [1.21.1] - 2025-04-09

### Fixed

- Unit search entry input

### Added

- Clear filter button

### Changed

- Some unit list optimizations

## [1.21.0] - 2025-04-08

### Added

- Fine column filter

### Changed

- Some title capitalized

## [1.20.0] - 2025-03-29

### Added

- Adaptive panes orientation

### Changed

- Default height an width values

## [1.19.2] - 2025-03-27

### Fixed

- Application title capitalization

## [1.19.0] - 2025-03-26

### Added

- New button Freeze
- New button Thaw
- New button reload unit
- Preference to change the color scheme

### Changed

- Move to Gnome 48 dependencies
- Named 4nyNoob as artist in the Credit section
- Named AsciiWolf and Justin Searle in the Acknowledgements section

### Fixed

- Unit list scroll focus
- Unit list grey out line if unit is inactive

## [1.18.2] - 2025-03-19

### Added

- The possibility to sort the Description column
- Add acknowledgements section in About Dialog
- Add artist in credits section

### Changed

- New application icon

### Fixed

- Remove duplicates in the unit list
- Fix failing to retrieve file path for some units

## [1.18.1] - 2025-03-18

### Fixed

- Possible application crashes

## [1.18.0] - 2025-03-17

### Added

- New columns: bus, preset, load and sub
- Grey out inactive unit row
- Highlight some cell content according to their value
- Toggle unit browser column visibility
- Save unit browser column visibility and width

### Changed

- Side menu to control unit
- Send kill signal interface improved

### Fixed

- Unit list value realtime update
- Saving bus level context

## [1.17.0] - 2025-03-06

### Added

- Feature: Queue signal (sigqueue)
- Feature: Clean unit (access rights not working, but provide workaround)

### Changed

- Side menu to control unit
- Send kill signal interface improved

## [1.16.0] - 2025-02-24

### Added

- Preference option to display unit file line number
- Filtering (search) option on all unit properties
- Possibility to hide empty unit properties
- Mnemonics to start and stop an unit

### Changed

- Faster journal events time processing

### Removed

- Independent preference option to highlight unit text file (now in the combo box)

### Fixed

- Unit file enable realtime status

## [1.15.0] - 2025-02-19

### Added

- Tooltips for enable status
- Possibility to change unit file highlight style
- Row number for unit file

### Changed

- Display a message if the unit has no unit file on the "unit file" tab

### Fixed

- Some unit files were not displayed

## [1.14.0] - 2025-02-17

### Added

- Retrieve the description of unloaded units for the list display
- Provide the possibility to list units from the system bus and from the user session
  bus at the same time

### Changed

- The list of all units is now fetched asynchronously

## [1.13.2] - 2025-02-11

### Fixed

- Change logs

## [1.13.1] - 2025-02-11

### Added

- Different toast messages have color

### Changed

- Button start is now non-blocking
- Button stop is now non-blocking
- Button restart is now non-blocking
- Button Reload (in menu) is now non-blocking
- Button "send kill" is now non-blocking
- Button kill has new icon

## [1.12.4] - 2025-02-08

### Fixed

- Make flatpak-linter pass on metainfo.xml

## [1.12.3] - 2025-02-08

### Added

- Add a CHANGELOG file

### Fixed

- LICENSE file name

## [1.12.2] - 2025-02-08

### Fixed

- Fix time_t conversion on 32bit architecture

## [1.12.1] - 2025-02-07

### Added

- Journal preferences batch size

### Removed

- Journal preferences maximum events

## [1.12.0] - 2025-02-07

### Changed

- Redo journal handling and display
- Lazy acquire journal events

## [1.11.0] - 2025-01-30

### Added

- Possibility to select Monospace Font for the different views

### Fixed

- Fix unit conversion

## [1.10.3] - 2025-01-27

### Fixed

- Fix text style

## [1.10.0] - 2025-01-22

### Added

- Start and stop buttons are highlighted according to the unit state
- You can choose the timestamp style between : Pretty, UTC and Unix

## [1.9.4] - 2025-01-21

This release worked on unit information

### Added

- Add "Error" Section
- Add hyperlink on units described by "Trigger"
- Add hyperlink on units described by "TriggeredBy"
- Display active status on units described by "Trigger"
- Display active status on units described by "TriggeredBy"
- Complete the "Memory" information section

### Fixed

- Fix the "Drop in" section
- Fix the "CPU" section

## [1.9.2] - 2025-01-18

- Fix unit information timer trigger

## [1.9.1] - 2025-01-16

- Fix scope unit information

## [1.9.0] - 2025-01-15

- Unit information: action man an http links
- Unit dependencies: add an unit type filter

## [1.8.2] - 2025-01-14

- Fix Unit info: CGroup now displays command line with arguments
- Fix Unit info: CGroup now displays all processes
- Fix Unit dependencies hyperlinks

## [1.8] - 2025-01-08

- New information page "Dependencies" to be able to view and navigate unit's
  dependencies
- New keyboard shortcuts no navigate unit's information pages
- Lazy load journal event
- Lazy load unit configuration file

## [1.7] - 2025-01-03

### Added

- Select a unit at program opening by passing a unit name as cli
  argument
  (see --help)

## [1.6] - 2024-12-30

- Improve User Experience for the Save file button
- Reduce needed Flatpak file permissions

## [1.5.1] - 2024-12-20

- Fix unit info links under Flatpak

## [1.5.0] - 2024-12-20

- Unit info now displays file links
- Unit info now displays Invocation
- Unit info now displays some gray shade

## [1.4] - 2024-12-19

- Add invocation Id on unit info file
- Add a filter base on "boot id" for journal events
- Add preferences to limit journal events
- Add Flatpak permission filesystem=/var/log:ro to access journal events
- Acquire journal events directly from systemd lib

## [1.3.2] - 2024-12-06

- Fix journal coloring for flatpak version

## [1.3.1] - 2024-11-29

- Unit's initialize time (Analyze blame) is now fetch asynchronously to avoid to block
  the application

## [1.3.0] - 2024-11-28

- Journal events are fetch asynchronously to avoid to block the application
- Setting to limit the number of journal events

## [1.2.0] - 2024-11-22

- Load all units asynchronously
- Relocate the Session / System message bus switcher on the main window

## [1.1.1] - 2024-11-12

- Add reload all units function
- Modify logo

## [1.0.1] - 2024-11-09

- Fix missing unit info

## [1.0.0] - 2024-11-08

- Provide the option to change mode for Start, Stop and Restart actions
- If unit's object path doesn't exist it asks it again
- Add keyboard shortcut Ctrl-f for opening search input
- Fix enable disable switch

## [0.1.12] - 2024-10-30

- Fix kill signals list scroll

## [0.1.11] - 2024-10-30

- New functionality: ability to send a kill signal to a unit
- The list now displays loaded and unloaded units
- Various look and feel changes

## [0.1.10] - 2024-10-22

- Add some colors on the unit information panel
- Add more information details on the unit information panel
- Fix the bytes calculation

## [0.1.9] - 2024-10-18

- Display a first opening message
- Improve the preference dialogue
- Unit file text highlighting
- Improve enable switch response
- Display journal logs text style

## [0.1.8] - 2024-10-08

- Remove the flatpak test at startup
- Migrate some widgets to libadwaita

## [0.1.7] - 2024-10-03

Update the unit information panel

## [0.1.6] - 2024-08-02

Add a proto preference panel

Release attempt on Flathub

## [0.1.3] - 2024-07-15

Make the sub windows modal. i.e. not separated form the main window

## [0.1.2] - 2024-07-07

Allow filtering on unit type

## [0.0.2] - 2024-06-21

First release of Rust Flatpak App
