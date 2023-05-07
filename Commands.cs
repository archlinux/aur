using System.Text.RegularExpressions;
using CommandLine;

namespace rgx;

internal interface ICmd
{
    [Value(0, MetaName = "pattern", Required = true)]
    public string pattern { get; set; }

    [Option('x', "options", Separator = ',', Required = false)]
    public IEnumerable<RegexOptions> options { get; set; }

    [Option('i', "input", Required = false, Default = null)]
    public string? input { get; set; }

    [Option('o', "output", Required = false, Default = null)]
    public string? output { get; set; }
}

[Verb("-M", true, new[] { "-R" })]
internal class MatchAndReplace : ICmd
{
    [Option('d', "default", Required = false, Default = null)]
    public bool useDefault { get; set; }

    [Value(1, MetaName = "replacement", Required = false, Default = null)]
    public string? replacement { get; set; }

    public string pattern { get; set; }
    public IEnumerable<RegexOptions> options { get; set; }
    public string? input { get; set; }
    public string? output { get; set; }
}

[Verb("-S")]
internal class Split : ICmd
{
    public string pattern { get; set; }
    public IEnumerable<RegexOptions> options { get; set; }
    public string? input { get; set; }
    public string? output { get; set; }
}