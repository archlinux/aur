# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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


